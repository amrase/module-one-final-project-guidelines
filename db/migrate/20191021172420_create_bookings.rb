class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :hotel_id
      t.string :reservation_start_date
      t.string :reservation_end_date
    end
  end
end
