class PimpedCarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @pimped_cars = PimpedCar.all
  end
end
