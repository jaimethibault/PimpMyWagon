class Booking < ApplicationRecord
  belongs_to :pimped_car
  belongs_to :user
  validates :starts_at, presence: true, allow_blank: false
  validates :ends_at, presence: true, allow_blank: false
  validates :status, inclusion: { in: ["pending", "accepted", "declined"]}
end
