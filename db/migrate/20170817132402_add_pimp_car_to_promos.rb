class AddPimpCarToPromos < ActiveRecord::Migration[5.0]
  def change
    add_reference :promos, :pimped_car, foreign_key: true
  end
end
