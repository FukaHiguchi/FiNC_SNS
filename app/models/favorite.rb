class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :step_log
end
