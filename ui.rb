require './add_entry.rb'
require './remove_entry.rb'
require './find_car.rb'
require './all_invoices.rb'
require './all_cars_entry.rb'


include AddEntry
include RemoveEntry
include FindCarAndInvoice
include AllInvoices
include AllCarsEntry

puts "\n\n"

puts "Welcome Admin "

one = "Add entry of the Car."
two = "Remove entry of the Car."
three = "Find the Car and get invoice"
four = "List of all Cars in parking lot."
five = "List of all invoices."
six = "Exit."

flag = true

while flag

    puts "\n*****************************************************"

    puts "\nChoose one of the following options(Enter the option number)"

    puts "\n 1. #{one} \n 2. #{two}  \n 3. #{three}  \n 4. #{four} \n 5. #{five}  \n 6. #{six} \n"

    puts "\n"

    option_selected = gets.to_i

    puts "\n"

    case
    when option_selected == 1
        then puts "You have selected, #{one}."
             take_entry

    when option_selected == 2
        then puts "You have selected, '#{two}'."
             remove_entry

    when option_selected == 3
        then puts "You have selected, '#{three}'."
             find_car_and_invoice

    when option_selected == 4
        then puts "You have selected, '#{four}'."
             all_cars_entry

    when option_selected == 5
        then puts "You have selected, '#{five}'."
             all_invoices

    when option_selected == 6
        then flag = false
             puts "You have selected, '#{six}'."

    else
        puts "Please enter a valid option."

    end

end

