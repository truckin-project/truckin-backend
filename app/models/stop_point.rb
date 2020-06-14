class StopPoint < ApplicationRecord
  has_one :address
  has_many :ratings
end
