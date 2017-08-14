class Booking < ApplicationRecord
  belongs_to :pimped_car
  belongs_to :user
end
