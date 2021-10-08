class LoyaltyPointTransactionsController < ApplicationController

before_action :authenticate_user!, only: [:new]

  def new
    @loyalty_point_transactions = LoyaltyPointTransaction.new
    @loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
    @customer = Customer.find(params[:customer_id])
    @t_mitras = current_user.t_mitras
  end

  def create
    if loyalty_point_transaction_params
      point_customer_transaction = loyalty_point_transaction_params[:point_customer_transaction].to_i
      params[:trans_type] = loyalty_point_transaction_params[:trans_type]
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
            flash[:notice] = "#{ptrans.point_customer_transaction} point(s) were given"
            redirect_to customer_loyalty_points_path(@customer.id) 
      elsif params[:trans_type] == "redeemed-point"
        p point_customer_transaction
        point_customer_transaction ||= LoyaltyProgram.find(params[:loyalty_program_id]).point_loyalty
          ptrans = LoyaltyPointTransaction.find_by(loyalty_point_id: params[:loyalty_point_id],
                                                    trans_type: "redeemed-point")

            loyalty_point = LoyaltyPoint.find(params[:loyalty_point_id])
            point_customer_transaction = -point_customer_transaction
            ptrans = LoyaltyPointTransaction.new(point_customer_transaction: point_customer_transaction, loyalty_point_id: params[:loyalty_point_id], trans_type: "redeemed-point")
            loyalty_point.point_customer += point_customer_transaction
            if ptrans.save && loyalty_point.save
              flash[:notice] = "Reward redeemed for #{-point_customer_transaction} point(s)"
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

  def update
     
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
      params.require(:loyalty_point_transaction).permit(:point_customer_transaction, :trans_type)
    end
  end
end
