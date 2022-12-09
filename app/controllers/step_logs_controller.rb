class StepLogsController < ApplicationController
  before_action :set_beginning_of_week

  private 
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
  def index
  end

  def new
    @step_logs = StepLog.new
  end 
end

