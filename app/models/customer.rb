class Customer < ApplicationRecord

  enum role: [:customer]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :customer
	end	

	def destroy
		update_attributes(deactivated_customer: true) unless deactivated_customer
	end	

	def active_for_authentication?
		super && !deactivated_customer
	end	

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable
end
