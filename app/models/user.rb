class User < ActiveRecord::Base
    has_many :bookings
    has_many :hotels, through: :bookings
end
