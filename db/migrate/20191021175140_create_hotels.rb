class CreateHotels < ActiveRecord::Migration[5.2]
  def change
    create_table :hotels do |t|
      t.string :hotel_name
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :website
      t.float :room_price
      t.string :email

    end
  end

  
end
