# frozen_string_literal: true

class Customers::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end

  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])

    if resource.errors.empty?
      set_flash_message(:notice, :confirmed) if is_navigational_format?
      #sign_in(resource_name, resource)
      respond_with_navigational(resource){ redirect_to
            after_confirmation_path_for(resource_name, resource) }
    else
      flash[:notice] = "Email sudah di Konfirmasi, Silahkan login kembali."
      redirect_to '/login-customer'
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  #def after_resending_confirmation_instructions_path_for(resource_name)
    #new_customer_session_path
  #end

  # The path used after confirmation.
   def after_confirmation_path_for(resource_name, resource)
     new_customer_session_path
   end
end
