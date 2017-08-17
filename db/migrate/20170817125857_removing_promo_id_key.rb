class RemovingPromoIdKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :promos, column: :pimped_car_id
  end
end
