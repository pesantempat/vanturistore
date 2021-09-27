class CustomersController < ApplicationController
  before_action :set_customer, only: [:update, :show, :edit, :destroy]
  before_action :authenticate_user!
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
    customer = Customer.find(params[:id])
    authorize customer
    customer.destroy
    redirect_to customers_path, :notice => "Customer has been deactivated."
  end

  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def secure_params
    params.require(:customer).permit(:role, :deactivated_customer)
  end

end
