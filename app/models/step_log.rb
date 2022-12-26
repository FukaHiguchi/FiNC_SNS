class StepLog < ApplicationRecord
  def start_time
    self.day
  end

  def self.chart(date)
    data_array = StepLog.pluck(:day, :footsteps).to_h
    if data_array != nil
      date_to = date.end_of_month
      date_from = date.beginning_of_month
      
      data =[]
      (date_from..date_to).each do |day|
        if data_array[day] == nil
          data.push([day.mday, nil])
        else
          data.push([day.mday, data_array[day]])
        end
      end
      
      return data
    
    end




  end

end
