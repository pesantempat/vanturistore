class LoyaltyPointTransactionsController < ApplicationController

before_action :authenticate_user!, only: [:new]

  #def index
    #@loyalty_point_transactions = LoyaltyPointTransaction.where(loyalty_point_id: params[:loyalty_point_id]).order("created_at desc").all
    #@loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
    #@customer = Customer.find(params[:customer_id])
    #@t_mitras = current_user.t_mitras
  #end

  def new
    @loyalty_point_transactions = LoyaltyPointTransaction.new
    @loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
    @customer = Customer.find(params[:customer_id])
    @t_mitras = current_user.t_mitras
  end

  #def edit 
    #@loyalty_point_transaction = LoyaltyPointTransaction.find(params[:id])
    #@loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
    #@customer = Customer.find(params[:customer_id])
    #@t_mitras = current_user.t_mitras
  #end

  def create
    if loyalty_point_transaction_params
      point_customer_transaction = loyalty_point_transaction_params[:point_customer_transaction].to_i
      params[:trans_type] = loyalty_point_transaction_params[:trans_type]
      params[:status_transaksi] = loyalty_point_transaction_params[:status_transaksi]
    end
    if customer_representing_self?(params) && customer_on_account?(params)
      if params[:trans_type] == "get-point"
        point_customer_transaction ||= 1
        ptrans = LoyaltyPointTransaction.find_by(loyalty_point_id: params[:loyalty_point_id],
                                             trans_type: "get-point")
                               
            # Wrap this in a transaction
            ptrans = LoyaltyPointTransaction.new(point_customer_transaction: point_customer_transaction,
                                           loyalty_point_id: params[:loyalty_point_id])
            @loyalty_point.point_customer += ptrans.point_customer_transaction
            ptrans.save
            @loyalty_point.save
            flash[:notice] = "#{ptrans.point_customer_transaction} point telah diberikan dan email notifikasi telah terkirim ke customer"
            redirect_to customer_loyalty_points_path(@customer.id)
            LoyaltyPointTransactionMailer.get_point(@loyalty_point, ptrans).deliver_later!(wait: 1.second) 
      elsif params[:trans_type] == "redeemed-point"
        p point_customer_transaction
        point_customer_transaction ||= LoyaltyProgram.find(params[:loyalty_program_id]).point_loyalty
        reward_transaction ||= LoyaltyProgram.find(params[:loyalty_program_id]).reward.reward_name
        reward_expired ||= LoyaltyProgram.find(params[:loyalty_program_id]).end_loyalty
          ptrans = LoyaltyPointTransaction.find_by(loyalty_point_id: params[:loyalty_point_id],
                                                    trans_type: "redeemed-point", status_transaksi: "belum")

            loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
            point_customer_transaction = -point_customer_transaction
            reward_transaction = reward_transaction
            reward_expired = reward_expired
            ptrans = LoyaltyPointTransaction.new(point_customer_transaction: point_customer_transaction, loyalty_point_id: params[:loyalty_point_id], trans_type: "redeemed-point", reward_transaction: reward_transaction, reward_expired: reward_expired, status_transaksi: "belum")
            loyalty_point.point_customer += point_customer_transaction
            if ptrans.save && loyalty_point.save
              if current_user
                flash[:notice] = "Redeemed #{-point_customer_transaction} point berhasil, Email notifikasi telah terkirim ke customer"
              else current_customer
                flash[:notice] = "Redeemed #{-point_customer_transaction} point berhasil, silahkan cek email anda"
              end 
              LoyaltyPointTransactionMailer.redeemed_point(@loyalty_point, ptrans).deliver_later!(wait: 1.second)
            else
              flash[:alert] = "Redemption request failed"
            end
            if current_user
              redirect_to customer_loyalty_points_path(@customer.id)
            else current_customer
              redirect_to customer_mypoint_path(@customer.id)
            end
      end
    end
  end

  def update
    @loyalty_point_transaction = LoyaltyPointTransaction.find(params[:id])
    if @loyalty_point_transaction.update_attributes(loyalty_point_transaction_params)
      redirect_back fallback_location: home_index_path, :notice => "Status berhasil di update."
    else
      redirect_back fallback_location: home_index_path, :alert => "Status gagal di update"
    end
  end
    

  private

  def customer_representing_self?(params)
    @customer = Customer.find(params[:customer_id].to_i)
  end

  def customer_on_account?(params)
    @loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
    #@customer = Customer.find(params[:customer_id].to_i)
    #@t_mitras = current_user.t_mitras
  end

  def loyalty_point_transaction_params
    if params[:loyalty_point_transaction]
      params.require(:loyalty_point_transaction).permit(:point_customer_transaction, :trans_type, :reward_transaction, :reward_expired, :status_transaksi)
    end
  end
end
