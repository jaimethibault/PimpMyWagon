class ChangeDateFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :starts_on, :datetime
    change_column :bookings, :ends_on, :datetime
  end
end
