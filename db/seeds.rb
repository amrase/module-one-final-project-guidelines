User.destroy_all
Hotel.destroy_all
require 'faker'
include Faker

10.times do
User.create(
    name: Faker::Name.name,
    city:Faker::Address.city,
    email:Internet.email
)
end



10.times do
    Hotel.create(
        hotel_name: Faker::Company.name,
        address: Faker::Address.street_address,
        city: Faker::Address.city,
        zipcode:  Faker::Address.zip_code,
        website: Faker::Internet.url,
        room_price:Faker::Commerce.price,
        email:Faker::Internet.email
    )
end




