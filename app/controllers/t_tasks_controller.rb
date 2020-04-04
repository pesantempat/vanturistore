class TTasksController < ApplicationController
  before_action :set_t_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /t_tasks
  # GET /t_tasks.json
  def index
    @t_tasks = TTask.all
    @t_tasks = current_user.t_tasks
  end

  # GET /t_tasks/1
  # GET /t_tasks/1.json
  def show
  end

  # GET /t_tasks/new
  def new
    @t_task = TTask.new
  end

  # GET /t_tasks/1/edit
  def edit
    @t_produks = current_user.t_tasks
  end

  # POST /t_tasks
  # POST /t_tasks.json
  def create
    @t_task = TTask.new(t_task_params)
    @t_task.user = current_user

    respond_to do |format|
      if @t_task.save
        format.html { redirect_to @t_task, notice: 'T task was successfully created.' }
        format.json { render :show, status: :created, location: @t_task }
      else
        format.html { render :new }
        format.json { render json: @t_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_tasks/1
  # PATCH/PUT /t_tasks/1.json
  def update
    respond_to do |format|
      if @t_task.update(t_task_params)
        format.html { redirect_to @t_task, notice: 'T task was successfully updated.' }
        format.json { render :show, status: :ok, location: @t_task }
      else
        format.html { render :edit }
        format.json { render json: @t_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_tasks/1
  # DELETE /t_tasks/1.json
  def destroy
    @t_task.destroy
    respond_to do |format|
      format.html { redirect_to t_tasks_url, notice: 'T task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_task
      @t_task = TTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def t_task_params
      params.require(:t_task).permit(:nama_task, :description, :rupiah, :presentase, :waktu, :frekuensi, :tingkat_kesulitan, :user_id)
    end
end
