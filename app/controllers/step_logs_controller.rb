class StepLogsController < ApplicationController
  before_action :set_beginning_of_week
  def index
    @step_logs = StepLog.where(user_id: current_user.id).order(day: :asc)
    @q = @step_logs.ransack(params[:q])
    @results = @q.result(distinct: true)

  end

  def new
    @date = Date.current
    if params[:format] != nil
      @date = params[:format].to_date
    end
    @step_logs = StepLog.where(user_id: current_user.id)
    @step_log = StepLog.new
  end
  
  def create
    @step_log = StepLog.new(log_params)
    @step_log.user_id = current_user.id
    if @step_log.save!
      redirect_to root_path
    else
      redirect_to new_step_log_path
    end
  end

  def show 
    
  end

  def edit
    @date = params[:format].to_date
    @step_logs = StepLog.where(user_id: current_user.id)
    @step_log = StepLog.find(params[:id])
  end

  def update
    @step_log = StepLog.find(params[:id])
    if @step_log.update(log_params)
      redirect_to step_logs_path
    else
      render :new
    end
  end

  def destroy
    @step_log = StepLog.find(params[:id])
    if @step_log.destroy
      redirect_to step_logs_path
    else
      flash.now[:danger] = "消去に失敗しました"
      redirect_to step_logs_path
    end
  end

  private 
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def log_params
    params.require(:step_log).permit(:footsteps, :distant, :burned_calorie, :duration, :day, :user_id)
  end

end

