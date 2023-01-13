class StepLog < ApplicationRecord
  belongs_to :user
  has_many :favorites , dependent: :destroy
  
  def start_time
    self.day
  end

  def self.chart(date,current_user_id)
    data_array = StepLog.where(user_id: current_user_id).pluck(:day, :footsteps).to_h
    p data_array
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
