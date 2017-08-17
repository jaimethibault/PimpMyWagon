class AddCoordinatesToPimpedCars < ActiveRecord::Migration[5.0]
  def change
    add_column :pimped_cars, :address, :string
    add_column :pimped_cars, :latitude, :float
    add_column :pimped_cars, :longitude, :float
  end
end
