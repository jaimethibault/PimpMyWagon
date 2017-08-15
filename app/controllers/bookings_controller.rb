class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_bookings, only: [:show, :total, :edit, :update]

  def index
    # Get all the booking regarding the current user
    @bookings = current_user.bookings
    # Get all the cars related to a user
    @cars = PimpedCar.where("user_id = #{current_user.id}")
  end

  def show
    @owner = email_owner(@booking)
    @renter = email_renter(@booking)
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

  def set_bookings
    @booking = Booking.find(params[:id])
  end

  def email_owner(booking)
    pimped_car = PimpedCar.find(booking.pimped_car_id)
    owner_id = pimped_car.user_id
    @owner = User.find(owner_id)
    @owner.email
  end

  def email_renter(booking)
    renter = User.find(booking.user_id)
    renter_id = renter
    @renter = User.find(renter_id)
    @renter.email
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

  # Method that check if a Owner booking table is empty or not.
  # If empty the partial is not displayed
  # Only one render is allowed by method
  def display_owner(booking, view_path)
    if booking.empty?
    else
      render partial: "#{view_path}"
    end
  end

  # Method that check if a user booking table is empty or not.
  # If empty the partial is not displayed
  # Only one render is allowed by method
  def display_user(booking, view_path)
    if booking.empty?
    else
      render partial: "#{view_path}"
    end
  end

  helper_method :total, :email_owner, :email_renter, :display_owner, :display_user
end
