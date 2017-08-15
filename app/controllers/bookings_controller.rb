class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index

  end

  def edit
    @starts_at = @booking.starts_at
    @ends_at = @booking.ends_at
    @status_available = ["Declined", "Accepted"]
  end

  def update
    @booking.update(booking_params)
    if @booking.save
     redirect_to bookings_path
    else
      render :edit
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_on, :ends_on, :status, :user_id, :pimped_car_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
