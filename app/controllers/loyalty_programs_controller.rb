class LoyaltyProgramsController < ApplicationController
  before_action :set_loyalty_program, only: %i[ show edit update destroy ]
  before_action :set_t_mitra 
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /loyalty_programs or /loyalty_programs.json
  def index
    #@loyalty_programs = LoyaltyProgram.all
    @loyalty_programs = LoyaltyProgram.where(t_mitra_id: params[:t_mitra_id]).order("created_at DESC").all
    authorize LoyaltyProgram
  end

  # GET /loyalty_programs/1 or /loyalty_programs/1.json
  def show
    authorize @loyalty_program
  end

  # GET /loyalty_programs/new
  def new
    @loyalty_program = LoyaltyProgram.new
    @loyalty_programs = LoyaltyProgram.where(t_mitra_id: params[:t_mitra_id])
    @reward = Reward.all
    authorize @loyalty_program
  end

  # GET /loyalty_programs/1/edit
  def edit
    authorize @loyalty_program
    @reward = Reward.all
  end

  # POST /loyalty_programs or /loyalty_programs.json
  def create
    @loyalty_program = LoyaltyProgram.new(loyalty_program_params)
    @loyalty_program = @t_mitra.loyalty_programs.new(loyalty_program_params)
    authorize @loyalty_program

    respond_to do |format|
      if @loyalty_program.save
        format.html { redirect_to t_mitra_loyalty_program_path(@t_mitra, @loyalty_program), notice: "Loyalty program was successfully created." }
        format.json { render :show, status: :created, location: @loyalty_program }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @loyalty_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loyalty_programs/1 or /loyalty_programs/1.json
  def update
    authorize @loyalty_program
    respond_to do |format|
      if @loyalty_program.update(loyalty_program_params)
        format.html { redirect_to t_mitra_loyalty_program_path(@t_mitra, @loyalty_program), notice: "Loyalty program was successfully updated." }
        format.json { render :show, status: :ok, location: @loyalty_program }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @loyalty_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loyalty_programs/1 or /loyalty_programs/1.json
  def destroy
    authorize LoyaltyProgram
    @loyalty_program.destroy
    respond_to do |format|
      format.html { redirect_to t_mitra_loyalty_programs_path(@loyalty_program.t_mitra), notice: "Loyalty program was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loyalty_program
      @loyalty_program = LoyaltyProgram.find(params[:id])
    end

    #def user_is_t_mitra_admin?(params)
      #@t_mitra = current_user.t_mitra
      #@t_mitra.id == params[:t_mitra_id].to_i
    #end

    def set_t_mitra
      @t_mitras = current_user.t_mitras
      @t_mitra = TMitra.find(params[:t_mitra_id]) 
      #@t_mitra = TMitra.friendly.find(params[:t_mitra_id])
    end

    # Only allow a list of trusted parameters through.
    def loyalty_program_params
      params.require(:loyalty_program).permit(:point_loyalty, :start_loyalty, :end_loyalty, :status_loyalty, :keterangan_loyalty, :reward_id, :t_mitra_id)
    end
end
