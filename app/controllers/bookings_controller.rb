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

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pimpedcar = PimpedCar.find(params[:pimped_car_id])
    @booking.pimped_car = @pimpedcar
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      #TODO : redirect to the booking show (with pending status)
      redirect_to booking_path(@booking)
    else
      render 'pimped_cars/show'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :status, :user_id, :pimped_car_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
