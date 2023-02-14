class StepLog < ApplicationRecord
  belongs_to :user
  has_many :favorites , dependent: :destroy
  validates :footsteps, presence: true
  validates :day , presence: true

  def favorited?(u)
    Favorite.where(step_log_id: u.id ).exists?
  end
  
  def start_time
    self.day
  end

  def self.chart(date,current_user_id)
    data_array = StepLog.where(user_id: current_user_id).pluck(:day, :footsteps).to_h
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
      p "ここここここ"
      p data
      return data
     
    end




  end

end
