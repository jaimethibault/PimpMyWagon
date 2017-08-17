class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bookings, only: [:show, :total, :edit, :update]

  def index
    # Get all the booking regarding the current user
    @bookings = current_user.bookings
    # Get all the cars related to a user
    @cars = PimpedCar.where("user_id = #{current_user.id}")
    @status_available = ["declined", "accepted"]

  end

  def show
    @owner = owner(@booking)
    @renter = renter(@booking)
    @total = total(@booking)
  end

  def edit
    @status_available = ["declined", "accepted"]
  end

  def update

    @booking.update(booking_params)
    if @booking.save
     redirect_to bookings_path
    else
      render :index
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

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def owner(booking)
    pimped_car = PimpedCar.find(booking.pimped_car_id)
    owner_id = pimped_car.user_id
    @owner = User.find(owner_id)
    @owner
  end

  def renter(booking)
    renter = User.find(booking.user_id)
    renter_id = renter
    @renter = User.find(renter_id)
    @renter
  end

  def car(booking)
    @car = PimpedCar.find(booking.pimped_car_id)
    @car
  end

  def total(booking)
    start_date = booking.starts_at
    end_date = booking.ends_at
    pimped_car = PimpedCar.find(booking.pimped_car_id)
    price_per_day = pimped_car.price_per_day
    @total = (price_per_day * (end_date - start_date)) / 86400
  end

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :status, :user_id, :pimped_car_id)
  end

  helper_method :total, :owner, :renter, :car
end
