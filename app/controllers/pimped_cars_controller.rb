require 'date'
class PimpedCarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_pimped_cars, only: [:show]

  def index
    unless params[:address].nil?
      @pimped_cars = PimpedCar.near(params[:address], params[:distance])
    else
      @pimped_cars = PimpedCar.where.not(latitude: nil, longitude: nil)
    end
    # if address is inside params (query string) >> @pimped_cars = PimpedCar.near
    # sinon comme d'hab
    @hash = Gmaps4rails.build_markers(@pimped_cars) do |pimped_car, marker|
      marker.lat pimped_car.latitude
      marker.lng pimped_car.longitude
      marker.infowindow render_to_string(partial: "/pimped_cars/map_box", locals: { pimped_car: pimped_car })
    end
  end

  def show
    @booking = Booking.new
    unless @pimped_car.promo.blank?
      @discount = (@pimped_car.promo.discount*100).to_i
      now = DateTime.now
      limit_time = @pimped_car.promo.limit_offer_date
       @difference = (limit_time - now).to_i
    end
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
