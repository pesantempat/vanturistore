class ApplicationController < ActionController::Base

 include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception

  private

	def after_sign_in_path_for(resource_or_scope)
	  home_index_path
	end

	def after_sign_out_path_for(resource_or_scope)
	  root_path
	end
end
