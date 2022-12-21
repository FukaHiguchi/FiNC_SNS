class StepLog < ApplicationRecord
  def start_time
    self.day
  end

  def self.chart(date)
    data_array = StepLog.pluck(:day, :footsteps).to_h
    return if data_array.blank?
      date_to = date.end_of_month
      date_from = date.beginning_of_month
      
      (date_from..date_to).each do |day|
        # p date
        data_array[day] = nil if data_array[day] == nil
      end
      data = data_array.sort
    
      p "グラフ"
      p data


  end


end
