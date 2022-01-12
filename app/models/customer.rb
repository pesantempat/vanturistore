class Customer < ApplicationRecord
	has_many :loyalty_points

# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable, :validatable, :omniauthable, :omniauth_providers => [:facebook]	
		 
  validates_uniqueness_of :phone_customer
  #validates :phone_number, phone: { possible: false, allow_blank: true, types: [:mobile] }

  enum role: [:customer]
	after_initialize :set_default_role, :if => :new_record?

	def set_default_role
		self.role ||= :customer
	end	

	def destroy
		update_attributes(deactivated_customer: true) unless deactivated_customer
	end

	#def login_terakhir
		#(Time.now.to_date - current_sign_in_at.to_date).to_i
  	#end	

	def active_for_authentication?
		super && !deactivated_customer
	end	

	def self.new_with_session(params, session)
		super.tap do |customer|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
			customer.email = data["email"] if customer.email.blank?
		  end
		end
	  end
	  
	  def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |customer|
		  customer.email = auth.info.email
		  customer.password = Devise.friendly_token[0,20]
		  customer.name_customer = auth.info.name   # assuming the user model has a name
		  #customer.brithday_customer = auth.info.user_birthday
		  #customer.phone_customer = auth.info.phone_number
		  customer.image = auth.info.image # assuming the user model has an image
		  customer.confirmed_at = Time.zone.now
		end
	  end

	  def needs_phone_customer_verifying?
		if is_verified
		  return false
		end
		if phone_customer.blank?
		  return false
		end
		return true
	  end

  
end
