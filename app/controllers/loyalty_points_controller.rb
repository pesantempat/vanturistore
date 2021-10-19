class LoyaltyPointsController < ApplicationController
  #before_action :set_loyalty_point, only: %i[ show edit update destroy ]
  #before_action :set_customer
  #before_action :set_t_mitra
  before_action :authenticate_user!, only: [:index]
  before_action :authenticate_customer!, only: [:mypoint]


  # GET /loyalty_points or /loyalty_points.json
  def index
    if current_user
        #@loyalty_points = customer.t_mitra.loyalty_points
        @loyalty_points = LoyaltyPoint.where(customer_id: params[:customer_id]).all
        @t_mitras = current_user.t_mitras 
        @customer = Customer.find(params[:customer_id])
    end
  end

  def mypoint
    @t_mitras = TMitra.all
    @loyalty_points = current_customer.loyalty_points
    #@loyalty_programs = LoyaltyProgram.where(:status_loyalty => "Actived").order("created_at DESC").all
    #if params[:customer_id]
      #@customer = Customer.find(params[:customer_id])
      #@loyalty_point = LoyaltyPoint.find_by(customer_id: @customer.id)
    #end 
      #@loyalty_point = LoyaltyPoint.find_by(customer_id: current_customer.id)
  end  

  # GET /loyalty_points/1 or /loyalty_points/1.json
  def show
    if customer_signed_in?
      @loyalty_points = LoyaltyPoint.all
      @t_mitras = TMitra.all
      if customer_representing_self?(params) && customer_on_loyalty_point?(params)
        ptranss = @loyalty_point.loyalty_point_transactions
        @approved = ptranss
      else
        redirect_to homecustomer_path
      end
    else user_signed_in?
      @loyalty_point = LoyaltyPoint.find(params[:id])
      @customer = Customer.find(params[:customer_id].to_i)
      @t_mitras = current_user.t_mitras
      ptranss = @loyalty_point.loyalty_point_transactions
      @approved = ptranss
    end  
  end

  # POST /loyalty_points or /loyalty_points.json
  def create
     if customer_representing_self?(params)
      begin
        @loyalty_point = LoyaltyPoint.new(point_customer: 0, customer_id: params[:customer_id], t_mitra_id: params[:t_mitra_id])
        @loyalty_point.save
        flash[:notice] = "Join successfully"
        if current_user
          redirect_to customer_loyalty_points_url(current_customer)
        else current_customer
          redirect_to customer_mypoint_path(current_customer) 
        end   
      rescue ActiveRecord::RecordNotUnique => e
        flash[:alert] = "Already join"
        if current_user
          redirect_to customer_loyalty_points_url(current_customer)
        else current_customer
          redirect_to customer_mypoint_path(current_customer)
        end  
      end
      else
      redirect_to root_path
    end
  end


  # DELETE /loyalty_points/1 or /loyalty_points/1.json
  def destroy
    @loyalty_point.destroy
    respond_to do |format|
      format.html { redirect_to loyalty_points_url, notice: "Join was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def customer_representing_self?(params)
      customer_signed_in? && current_customer.id == params[:customer_id].to_i
    end

    def customer_on_loyalty_point?(params)
      @loyalty_point = LoyaltyPoint.find(params[:id])
      if current_user
        @loyalty_points = LoyaltyPoint.where(customer_id: params[:customer_id]).all
      else current_customer
        current_customer.id == @loyalty_point.customer_id
      end
    end
end
