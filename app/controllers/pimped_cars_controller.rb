class PimpedCarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pimped_cars, only: [:show]

  def index
    @pimped_cars = PimpedCar.all
  end

  def show
    @booking = Booking.new
    @discount =
    @limit_offer_date = pimped_car(@limit_offer_date)
  end

  def new
    @pimped_car = PimpedCar.new
  end

  def create
    @pimped_car = PimpedCar.new(set_params)
    @pimped_car.user_id = current_user.id
    if @pimped_car.save
      redirect_to pimped_cars_path(@pimped_car)
    else
      render :new
    end
  end

  private

  def set_params
    params.require(:pimped_car).permit(:name, :price_per_day, :description, :address, :photo)
  end

  def set_pimped_cars
    @pimped_car = PimpedCar.find(params[:id])
  end
end
