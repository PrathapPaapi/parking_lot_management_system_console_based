require_relative 'parking_lot.rb'
# Can you create a Gemfile? (created)
require 'colorize'

puts "\n\n"

puts "Welcome Admin"

puts "\n*****************************************************"


PARKING_LOTS_HASH = Hash.new

def create_parking_lot
    
	puts "\n Enter the parking lot name: \n"
	parking_lot_name = gets.chomp.to_s

	# Any better name for the method
	if has_parking_lot?(parking_lot_name)
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

	unless has_parking_lot?(parking_lot_name)
		puts "\nParking lot not found.".red
		return
	end

	parking_lot = PARKING_LOTS_HASH[parking_lot_name]

	while true 

		parking_lot_options = { 1 => "Add entry of the Car.", 
														2 => "Remove entry of the Car.", 
														3 => "Find the invoice", 
														4 => "List of all Cars in parking lot.", 
														5 => "List of all invoices.", 6 => "Exit."
												}

			# Rename to a better name? (tried)
		if parking_lot.parking_size_check
				puts "\n\n"
				puts "Parking lot size limit reached: #{ParkingLot::PARKING_LOT_SIZE}".red
				puts "\n"
		end

		puts "\n*****************************************************"

		puts "\nChoose one of the following options(Enter the option number)"

		parking_lot_options.each do |opt, description|
				puts "\n #{opt}. #{description}"
		end

		puts "\n"

		option_selected = gets.to_i

		puts "\n"

		case option_selected
		when 1
			then puts "You have selected, '#{parking_lot_options[1]}'."
				parking_lot.add_entry
		when 2
			then puts "You have selected, '#{parking_lot_options[2]}'."
				parking_lot.remove_entry
		when 3
			then puts "You have selected, '#{parking_lot_options[3]}'."
				parking_lot.find_required_car
		when 4
			then puts "You have selected, '#{parking_lot_options[4]}'."
				parking_lot.print_all_cars
		when 5
			then puts "You have selected, '#{parking_lot_options[5]}'."
				parking_lot.print_all_invoices
		when 6
			then puts "You have selected, '#{parking_lot_options[6]}'."
				break
		else
				puts "Please enter a valid option."
		end
	end

end

def remove_parking_lot
	puts "\n Enter the parking lot name: \n"
	parking_lot_name = gets.chomp

	unless has_parking_lot?(parking_lot_name)
		puts "\nInvalid parking lot name.".red
		return
	end

	PARKING_LOTS_HASH.delete_if { |key, value| key == parking_lot_name }

	puts "\n #{parking_lot_name} Parking Lot removed successfully.\n"
end

def list_parking_lots

	if PARKING_LOTS_HASH.size == 0
		puts "\n No parking lots found."
		return
	end

	puts "\nList of all parking lots: \n"
	PARKING_LOTS_HASH.each do |key, value|
		puts "\n"
		puts key
	end
end


def has_parking_lot?(parking_lot_name)
	PARKING_LOTS_HASH.any? {|key, value| key == parking_lot_name}
end

while true

	puts "\nChoose one of the following options(Enter the option number)"

	options = { 1 => "Create a Parking Lot.", 
							2 => "Open the Parking Lot.", 
							3 => "Remove a Parking Lot", 
							4 => "List all Parking Lots.", 
							5 => "Exit."
					}
	
	options.each do |key, value|
		puts "\n #{key}. #{value}"
	end

	puts "\n"

	option_selected = gets.to_i

	puts "\n"

	case option_selected
	when 1
		then puts "You have selected, 'Create a Parking Lot'."
			create_parking_lot
	when 2
		then puts "You have selected, 'Open the Parking Lot'"
			open_parking_lot
	when 3
		then puts "You have selected, 'Remove a Parking Lot'."
			remove_parking_lot
	when 4
		then puts "You have selected, 'List all Parking Lots'."
			list_parking_lots   
	when 5
		then puts "You have selected, 'Exit'."
			exit
	else
			puts "Please enter a valid option."
	end
end

