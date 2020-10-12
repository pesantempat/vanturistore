class TMitraPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def index?
    @current_user.admin?
  end

  def profilmitra?
    @current_user.mitra?
  end

  def show?
    @current_user.admin? or @current_user.mitra?
  end

  def new?
    @current_user.admin?
  end

  def create?
    @current_user.admin?
  end

  def edit?
    @current_user.admin?
  end

  def update?
    @current_user.admin?
  end

  def destroy?
    return false if @current_mitra == @user
    @current_user.admin?
  end

end
