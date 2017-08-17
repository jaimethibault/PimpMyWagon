class RemoveFormKeyVar < ActiveRecord::Migration[5.0]
  def change
          remove_column :promos, :pimped_car_id
  end
end
