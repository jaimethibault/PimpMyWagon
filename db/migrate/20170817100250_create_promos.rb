class CreatePromos < ActiveRecord::Migration[5.0]
  def change
    create_table :promos do |t|
      t.float :discount
      t.datetime :limit_offer_date
      t.references :pimped_car, foreign_key: true

      t.timestamps
    end
  end
end
