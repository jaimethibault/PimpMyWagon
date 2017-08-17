class PimpedCar < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :price_per_day, presence: true, numericality: { only_integer: true }
  has_many :bookings
  has_many :promos
  has_attachment :photo
end
