class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :stop_point
end
