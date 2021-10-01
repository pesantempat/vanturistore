class CustomersController < ApplicationController
  before_action :set_customer, only: [:update, :show, :edit, :destroy]
  before_action :authenticate_user!
   before_action :set_t_mitra 
  after_action :verify_authorized

  def index
    @customers = Customer.all
    authorize Customer
  end

 

  def edit
    authorize @customer
    flash[:info] =  "Hash: #{params}"
            @customer = CustomerLog.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    authorize @customer
    if @customer.update_attributes(secure_params)
      redirect_to customers_path, :notice => "Data Customer updated."
    else
      redirect_to customers_path, :alert => "Unable to update customer."
    end
  end

  def destroy
    authorize Customer
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def set_t_mitra
      @t_mitras = current_user.t_mitras
    end

  def secure_params
    params.require(:customer).permit(:role, :deactivated_customer, :name_customer, :email, :password, :password_confirmation, :brithday_customer, :phone_customer)
  end

end
