class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :status
      t.references :pimped_car, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
