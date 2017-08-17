class Promo < ApplicationRecord
  belongs_to :pimped_car
  validates :discount, presence: true
  validates :limit_offer_date, presence: true
end
