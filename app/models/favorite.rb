class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :step_log

  validates :user_id, presence: true
  validates :step_log_id, presence: true
end
