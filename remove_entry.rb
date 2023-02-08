require_relative 'parking_lot_validations.rb'
require_relative './generate_invoice.rb'
require 'colorize'

include ParkingLotValidations
include GenerateInvoice

module RemoveEntry
  def remove_entry_function(license_plate)
    unless is_a_valid_license_plate?(license_plate)
      puts "\n\n"
      puts "Enter a valid license plate".red
      return
    end

    required_entry = get_entry_of_license_plate(license_plate)

    if required_entry.nil?
      puts "\n\n"
      puts "license plate not found".red
      return
    end

    puts "\n"

    puts "License plate  : #{required_entry.license_plate}"
    puts "\n"

    puts "Parking Slot   : #{required_entry.parking_slot_identifier}"
    puts "\n"

    remove_from_entry_array(license_plate)

    generate_invoice(required_entry)
  end

  def remove_from_entry_array(license_plate)
    # It was difficult for me to figure out where this entries is comming from
    entries.delete_if{ |entry| entry.license_plate == license_plate }
  end
end