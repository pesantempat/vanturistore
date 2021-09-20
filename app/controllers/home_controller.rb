class HomeController < ApplicationController
	before_action :authenticate_user!, only: [:index]
  before_action :authenticate_customer!, only: [:index2]
  def index
    @t_mitras = TMitra.all
    @t_mitras = current_user.t_mitras
  end
  def index2
  end
end
