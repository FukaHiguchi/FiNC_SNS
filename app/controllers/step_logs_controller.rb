class StepLogsController < ApplicationController
  before_action :set_beginning_of_week

  private 
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
  
  def index
    render text:"HEllo"
    @step_logs = StepLog.all
    @step_log = StepLog.new
    @step_log = StepLog.find_by(date :params[:format])

  end

  def new
    
  end 
  def show 
  end
end

