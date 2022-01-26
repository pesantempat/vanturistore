class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_t_mitra
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :job_owner, only: [:edit]

  def index
    if current_user.admin?
      @users = User.all.where("role = 1").order("created_at ASC")
    else current_user.mitra?
      @users = User.all.where("role = 2").order("created_at ASC")
    end  
    authorize User
  end

  def job_owner
    unless @user.id != 1 && @user.id != 2 or current_user.admin? 
      flash[:notice] = 'Access denied'
      redirect_to users_path
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    authorize @user
  end

  def create
    @user = User.new(secure_params)
    authorize @user

    respond_to do |format|
      if @user.save
        if current_user.admin?
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        else current_user.mitra?
        format.html { redirect_to users_path, notice: 'Kasir berhasil dibuat' }
        end  
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      if current_user.admin?
        redirect_to users_path, :notice => "User updated."
        else current_user.mitra?
        redirect_to users_path, :notice => "Kasir berhasil di update."
        end 
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User has been deactivated."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_t_mitra
      @t_mitras = current_user.t_mitras
  end

  def secure_params
    params.require(:user).permit(:role, :email, :password, :deactivated, :name)
  end

end
