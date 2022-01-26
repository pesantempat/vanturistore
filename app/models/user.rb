class User < ApplicationRecord
	has_many :t_mitras

	enum role: [:admin, :mitra, :kasir]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :admin
	end	

	def destroy
		update_attributes(deactivated: true) unless deactivated
	end	

	def active_for_authentication?
		super && !deactivated
	end	

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
