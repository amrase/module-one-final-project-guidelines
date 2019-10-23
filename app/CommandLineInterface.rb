require 'tty-prompt'


class CommandLineInterface

     def run
        
        prompt = TTY::Prompt.new
            puts "Hello and welcome to Bookings app!".blue
    
             selection = prompt.select("Check one of our options", [
                { name: 'Select destination', value: 1 },
                { name: 'Check Hotel Prices', value: 2 },
                { name: 'Delete/Update Booking', value: 3 },
                { name:  'Exit', value: 4 }])
           
             if selection == 1
                user_login
                select_all_city
                
             elsif selection == 2
                check_hotel_prices

             elsif selection == 3
                update_delete_user
             else 
                exit
             end
          
     end   
     
     #create a userin 
     def user_login
        prompt = TTY::Prompt.new
        full_name =prompt.ask("Please enter your full name?")
        origin = prompt.ask("Please enter your origin city?")
        user_email = prompt.ask("Please enter your email?")
        @user_name = User.create(name: "#{full_name}",city: "#{origin}",email:"#{user_email}")
        # user_id_show=prompt.select("Your user ID:",@user_name.id)
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
        @location.bookings << Booking.create(reservation_start_date: in_date,reservation_end_date: out_date,user_id: @user_name.id,hotel_id: @location.id)
        sleep(2)
        #.all
        prompt.ask("Thank you for choosing us #{@location.bookings.last.id } ,you will receive an email confirmation")
        run 

    end


    def  check_hotel_prices
   
        prompt = TTY::Prompt.new
        Hotel.all.pluck(:hotel_name, :room_price).each {|x| puts "- #{x[0]} - $#{x[1]}"}
        sleep(3)
        run    
    end
    
    
    def update_delete_user
        prompt = TTY::Prompt.new
        selection = prompt.select("Check one of our options", [
            { name: 'Update ', value: 1 },
            { name: 'Delete a booking', value: 2 },
            { name: 'Return Back', value: 3 }])
            


            if selection == 1
                update_booking_destination
                
            elsif selection == 2
                delete_booking
            else
                exit
            end   
          
        end

            def update_booking_destination
                puts "update"
                prompt = TTY::Prompt.new
                id_check=prompt.mask("What is your Booking",required: true).to_i
                if Booking.exists?(id_check) 
                   
                end


            end
            
            
            def delete_booking
                prompt = TTY::Prompt.new
                id_check=prompt.mask("What is your Booking",required: true).to_i
                if Booking.exists?(id_check) 
                     Booking.find(id_check).destroy
                      puts  "Booking Deleted"
                      sleep(2)
                      run
                else 
                    puts "Booking number doesn't exsist !"
                    sleep(2)
                    run 
                end    
            end 
  
      
    def exit 
        exit
    end
    

 
end
