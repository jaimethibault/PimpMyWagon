class RenameFieldsInBookings < ActiveRecord::Migration[5.0]
  def change
    rename_column :bookings, :starts_on, :starts_at
    rename_column :bookings, :ends_on, :ends_at
  end
end
