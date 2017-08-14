class CreatePimpedCars < ActiveRecord::Migration[5.0]
  def change
    create_table :pimped_cars do |t|
      t.string :name
      t.integer :price_per_day
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
