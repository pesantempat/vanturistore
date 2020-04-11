class User < ApplicationRecord
	enum role: [:admin, :karyawan]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :admin
	end	

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :t_tasks
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
