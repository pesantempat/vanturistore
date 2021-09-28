class RewardsController < ApplicationController
  before_action :set_reward, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  after_action :verify_authorized

  # GET /rewards or /rewards.json
  def index
    @rewards = Reward.all
    authorize Reward
  end

  # GET /rewards/1 or /rewards/1.json
  def show
    authorize @reward
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
    authorize @reward
  end

  # GET /rewards/1/edit
  def edit
    authorize @reward
  end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)
    authorize @reward

    respond_to do |format|
      if @reward.save
        format.html { redirect_to rewards_path, notice: "Reward was successfully created." }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json
  def update
    authorize @reward
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to rewards_path, notice: "Reward was successfully updated." }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
    authorize Reward
    @reward.destroy
    respond_to do |format|
      format.html { redirect_to rewards_url, notice: "Reward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reward_params
      params.require(:reward).permit(:reward_name)
    end
end
