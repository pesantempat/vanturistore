class TMitrasController < ApplicationController
  before_action :set_t_mitra, only: [:show, :edit, :update, :destroy]
  before_action :set_user, except:[:show, :index]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /t_mitras
  # GET /t_mitras.json
  def index
    @t_mitras = TMitra.all
    @users = User.all
    authorize TMitra
  end

  # GET /t_mitras/1
  # GET /t_mitras/1.json
  def show
    authorize @t_mitra
    @user = User.all
  end

  # GET /t_mitras/new
  def new
    if @user.t_mitras.empty?
      @t_mitra = TMitra.new
      @t_mitras = TMitra.where(user_id: params[:user_id])
      authorize @t_mitra
    else
      # raise error which doesn't make sense or redirect like
      redirect_to @user
    end  
  end

  # GET /t_mitras/1/edit
  def edit
    authorize @t_mitra
  end

  # POST /t_mitras
  # POST /t_mitras.json
  def create
    @t_mitra = TMitra.new(t_mitra_params)
    @t_mitra = @user.t_mitras.new(t_mitra_params)
    authorize @t_mitra

    respond_to do |format|
      if @t_mitra.save
        format.html { redirect_to @t_mitra, notice: 'T mitra was successfully created.' }
        format.json { render :show, status: :created, location: @t_mitra }
      else
        format.html { render :new }
        format.json { render json: @t_mitra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_mitras/1
  # PATCH/PUT /t_mitras/1.json
  def update
    authorize @t_mitra
    respond_to do |format|
      if @t_mitra.update(t_mitra_params)
        format.html { redirect_to @t_mitra, notice: 'T mitra was successfully updated.' }
        format.json { render :show, status: :ok, location: @t_mitra }
      else
        format.html { render :edit }
        format.json { render json: @t_mitra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_mitras/1
  # DELETE /t_mitras/1.json
  def destroy
    authorize TMitra
    @t_mitra.destroy
    respond_to do |format|
      format.html { redirect_to t_mitras_url, notice: 'T mitra was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_mitra
      @t_mitra = TMitra.find(params[:id])
    end

     def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def t_mitra_params
      params.require(:t_mitra).permit(:nama_mitra, :alamat, :telp, :user_id)
    end
end
