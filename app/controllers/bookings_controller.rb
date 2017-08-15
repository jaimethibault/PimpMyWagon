class BookingsController < ApplicationController
  def index

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
    params.require(:booking).permit(:starts_at, :ends_at, :pimped_car_id)
  end
end
