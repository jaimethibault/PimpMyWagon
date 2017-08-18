class PimpedCar < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, allow_blank: false
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  validates :address, presence: true, allow_blank: false
  has_many :bookings
  has_one :promo
  has_attachment :photo
  validates :photo, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
