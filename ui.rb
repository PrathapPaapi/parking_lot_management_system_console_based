require_relative 'parking_lot.rb'
# Can you create a Gemfile?
require 'colorize'

require 'pry'

puts "\n\n"

puts "Welcome Admin"

puts "\n*****************************************************"


PARKING_LOTS_HASH = Hash.new

parking_flag = true

# Fix Indentation
# https://github.com/airbnb/ruby#indentation
def create_parking_lot
    
    puts "\n Enter the parking lot name: \n"
    parking_lot_name = gets.chomp.to_s

    # Any better name for the method
    if check_parking_lot_duplicates(parking_lot_name)
        puts "\nParking lot already exists.".red
        return
    end

    parking_lot = ParkingLot.new
    PARKING_LOTS_HASH.store(parking_lot_name, parking_lot)
    puts "\n #{parking_lot_name} Parking lot created successfully."
end

def open_parking_lot
    puts "\n Enter the parking lot name: \n"
    parking_lot_name = gets.chomp

    unless check_parking_lot_duplicates(parking_lot_name)
        puts "\nParking lot not found.".red
        return
    end

    parking_lot = nil
    PARKING_LOTS_HASH.each do |key, value|
        if key == parking_lot_name
            parking_lot = value
            break;
        end
    end

    flag = true

    # while true
    while flag

        # Is there a better way to store these values?
        # Lets say tomorrow you need to add another entry, how many places would you need to change?

        options = {
            "1" => "Add entry of the Car."
        }
        one =
        two = "Remove entry of the Car."
        three = "Find the invoice"
        four = "List of all Cars in parking lot."
        five = "List of all invoices."
        six = "Exit."
        seven = "Do not exit"

        # Rename to a better name?
        if parking_lot.parking_size_check
            puts "\n\n"
            puts "Parking lot size limit reached: #{ParkingLot.parking_lot_size}".red
            puts "\n"
        end

        puts "\n*****************************************************"

        puts "\nChoose one of the following options(Enter the option number)"

        options.each do |option_number, option_name|
            puts "#{option_number}. #{option_name}"
        end
        puts "\n 1. #{one} \n 2. #{two}  \n 3. #{three}  \n 4. #{four} \n 5. #{five}  \n 6. #{six} \n"

        puts "\n"

        option_selected = gets.to_i

        puts "\n"

        case
        # Can we avoid doing equal check on each line?
        when option_selected == 1
            then puts "You have selected, #{one}."
                parking_lot.add_entry

        when option_selected == 2
            then puts "You have selected, '#{two}'."
                parking_lot.remove_entry

        when option_selected == 3
            then puts "You have selected, '#{three}'."
                parking_lot.find_required_car

        when option_selected == 4
            then puts "You have selected, '#{four}'."
                parking_lot.print_all_cars

        when option_selected == 5
            then puts "You have selected, '#{five}'."
                parking_lot.print_all_invoices

        when option_selected == 6
            then flag = false
                puts "You have selected, '#{six}'."

        else
            puts "Please enter a valid option."

        end
    end

end

def remove_parking_lot
    puts "\n Enter the parking lot name: \n"
    parking_lot_name = gets.chomp

    unless check_parking_lot_duplicates(parking_lot_name)
        puts "\nInvalid parking lot name.".red
        return
    end

    temp_hash = Hash.new

    # Any better way to do this? You have already done this in other places
    PARKING_LOTS_HASH.each do |key, value|
        unless key == parking_lot_name
            temp_hash.store(key, value)
        end
    end

    PARKING_LOTS_HASH.clear()

    temp_hash.each do |key, value|
        PARKING_LOTS_HASH.store(key, value)
    end

    puts "\n #{parking_lot_name} Parking Lot removed successfully.\n"
end

def list_parking_lots

    puts "\nList of all parking lots: \n"
    PARKING_LOTS_HASH.each do |key, value|
        puts "\n"
        puts key
    end
end


def check_parking_lot_duplicates(parking_lot_name)
    flag = false
    PARKING_LOTS_HASH.each do |key, value|
        if key == parking_lot_name
            flag = true
        end
    end
    flag
end

while parking_flag

    puts "\nChoose one of the following options(Enter the option number)"

    puts "\n 1. Create a Parking Lot"

    puts "\n 2. Open the Parking Lot"

    puts "\n 3. Remove a Parking Lot"

    puts "\n 4. List all Parking Lots"

    puts "\n 5. Exit"

    puts "\n"

    option_selected = gets.to_i

    puts "\n"

    case
    when option_selected == 1
       then puts "You have selected, 'Create a Parking Lot'."
            create_parking_lot

    when option_selected == 2
        then puts "You have selected, 'Open the Parking Lot'"
            open_parking_lot

    when option_selected == 3
        then puts "You have selected, 'Remove a Parking Lot'."
            remove_parking_lot

    when option_selected == 4
        then puts "You have selected, 'List all Parking Lots'."
            list_parking_lots

    when option_selected == 5
        then puts "You have selected, 'Exit'."
             parking_flag = false

    else
        puts "Please enter a valid option."

    end
end

