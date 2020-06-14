class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :stop_point

  before_save :update_average!

  private
  def update_average!
    self.average = (bath + gas_price + security + food + parking)/5
  end
end
