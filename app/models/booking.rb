class Booking < ActiveRecord::Base
    belongs_to :users
    belongs_to :hotels


    def self.run
        puts "Hello There"
    end    
end
