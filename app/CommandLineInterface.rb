require 'tty-prompt'
class CommandLineInterface
    attr_accessor :prompt
    def initialize
        
    end

    # def prompt 
    #     prompt = TTY::Prompt.new
    # end 

     def run
        
        prompt = TTY::Prompt.new
            puts "Hello and welcome to Bookings app!".blue
            # binding.pry

            # selection = prompt.ask("Check one of our options ?")
        

             selection = prompt.select("Check one of our options", [
                { name: 'Select destination', value: 1 },
                { name: 'Check Hotel Prices', value: 2 },
                { name:  'Exit', value: 3 }])
           
             if selection == 1
                user_login
                select_all_city
                
             elsif selection == 2
                check_hotel_prices
             else 
                return
            end
          
     end   
     
     #create a user check in the selection method 
     def user_login
        prompt = TTY::Prompt.new
        full_name =prompt.ask("Please enter your full name?")
        origin = prompt.ask("Please enter your origin city?")
        user_email = prompt.ask("Please enter your email?")
        @user_name = User.create(name: "#{full_name}",city: "#{origin}",email:"#{user_email}")
     end

     def list_destination
         puts Hotel.all.map{|hotel_location| hotel_location.city}
         run
     end
    
     def all_hotels
        @prompt.select("Select Hotel") do |m|
            Hotel.all.each do |hotel|
                m.choice "#{hotel.hotel_name}", -> {@user.bookings.last.update(hotel_id: hotel.id)}
            end

        end
     end

    #Select all citys
    def select_all_city
        prompt = TTY::Prompt.new
        prompt.ask("Where would you like to go")
        @locations = Hotel.all.map {|hotel| hotel.city}.join(',')
        locatation_selection = prompt.select("Choose a right city for you?",@locations.split(','))
        @location = Hotel.find_by(city: locatation_selection)
        in_date=prompt.ask("Choose your check in date?")
        out_date=prompt.ask("Choese your check out date?")
        @u_name = User.find_by(name: @user_name)
        binding.pry
        @location.bookings << Booking.create(reservation_start_date: in_date, reservation_end_date: out_date,user_id: @user_name.id,hotel_id: @location.id)
        sleep(3)
        run 

    end


    def  check_hotel_prices
        prompt = TTY::Prompt.new
        # prompt.ask("Which hotel would you like to check?")
        @hotels = Hotel.all.map {|hotel| hotel.hotel_name}.join(',')
        hotel_selection = prompt.select("Which hotel would you like to check?",@hotels.split(','))
        @hotel = Hotel.find_by(hotel_name: hotel_selection)
        @prices=Hotel.all.map{|hotel|hotel.room_price}.join(',')
        price_selection = prompt.select("Prices for hotels?",@prices.split(','))
        @price = Hotel.find_by(hotel_name: price_selection)

    
        
    end
    
    
    # def check_dates_availlable

    # end

    # def select_rooms

    # end    
    

      
    def exit 
        exit
    end
    

 
end
