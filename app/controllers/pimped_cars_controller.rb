class PimpedCarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pimped_cars, only: [:show]

  def index
    @pimped_cars = PimpedCar.all
  end

  def show
  end

  def new
    @pimped_car = PimpedCar.new
  end

  def create
   @pimped_car = PimpedCar.new(set_params)
   @pimped_car.user_id = current_user.id
   @pimped_car.save
   redirect_to pimped_cars_path(@pimped_car)
  end

  private

  def set_params
    params.require(:pimped_car).permit(:name, :price_per_day, :description)
  end

  def set_pimped_cars
    @pimped_car = PimpedCar.find(params[:id])
  end
end
