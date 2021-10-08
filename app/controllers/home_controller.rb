class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:index]
  before_action :authenticate_customer!, only: [:index2]

  
  def index
    @t_mitras = TMitra.all
    @t_mitras = current_user.t_mitras
    @customers = Customer.all
    #@loyalty_points = LoyaltyPoint.all
    #@customers = Customer.all
    #@loyalty_points = customer_url.loyalty_points
  end
  
  def index2
    @t_mitras = TMitra.all
    @loyalty_points = LoyaltyPoint.all
  end

  def landingpage
  end

  def kebijakanprivasi
  end
end
