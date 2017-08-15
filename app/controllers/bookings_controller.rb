class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bookings, only: [:show, :total]

  def index
    @bookings = Booking.all
  end

  def show
    @owner = email_owner
    @renter = email_renter
    @total = total
  end

  private

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def email_owner
    pimped_car = PimpedCar.find(@booking.pimped_car_id)
    owner_id = pimped_car.user_id
    @owner = User.find(owner_id)
  end

  def email_renter
    renter = User.find(@booking.user_id)
    renter_id = renter
    @renter = User.find(renter_id)
  end

  def total
    start_date = @booking.starts_at
    end_date = @booking.ends_at
    pimped_car = PimpedCar.find(@booking.pimped_car_id)
    price_per_day = pimped_car.price_per_day
    @total = (price_per_day * (end_date - start_date)) / 86400
  end
end
