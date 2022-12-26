class StepLogsController < ApplicationController
  before_action :set_beginning_of_week
  
  def index
    @step_logs = StepLog.all.order(day: :asc)


  end

  def new
    @date = Date.current
    if params[:format] != nil
      @date = params[:format].to_date
    end
    @step_logs = StepLog.all
    @step_log = StepLog.new
  end
  
  def create
    @step_log = StepLog.new(log_parameter)
    if @step_log.save!
      redirect_to root_path
    else
      redirect_to step_logs_path
    end
  end


  def show 
    @step_logs = StepLog.all
  end

  private 
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

  def log_parameter
    params.require(:step_log).permit(:footsteps, :distant, :burned_calorie, :duration, :day,  descrete: true ,xtitle: '日付', ytitle: '歩数')
  end
end

