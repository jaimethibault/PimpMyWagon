class AddNewForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_column :promos, :pimped_cars_id, :integer
  end

end
