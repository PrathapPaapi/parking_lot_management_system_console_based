require_relative './entry_details.rb'
require_relative './invoice_details.rb'
require_relative 'parking_lot_validations.rb'
require 'colorize'

include ParkingLotValidations

module AddEntry
  def add_entry_call_methods(license_plate)
    unless is_a_valid_license_plate?(license_plate)
      puts "\n\n"
      puts "Enter a valid license plate".red
      return
    end

    # Why is this called plates?
    # Any better name? (tried)
    if has_license_plate?(license_plate)
      puts "\n\n"
      puts "License Plate exists in the record".blue
      return
    end

    parking_slot = get_parking_slot

    new_entry = EntryDetails.new(license_plate, parking_slot, Time.new)

    entries.push(new_entry)

    puts "\n\n"

    puts "#{license_plate} - Car added to the entry"

    new_entry
  end
end