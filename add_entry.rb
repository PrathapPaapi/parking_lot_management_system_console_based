require_relative './entry_details.rb'
require_relative './invoice_details.rb'
require_relative 'validations.rb'
require 'colorize'
require 'pry'

include Validations

module AddEntry

    def add_entry_call_methods(license_plate)

        if !license_plate_valid(license_plate)
            puts "\n\n"
            puts "Enter a valid license plate".red
            return
        end

        if duplicates_plates_check(license_plate)
            puts "\n\n"
            puts "License Plate exists in the record".blue
            return
        end

        parking_slot = get_parking_slot

        new_entry = EntryDetails.new(license_plate, parking_slot, Time.new)

        entries.push(new_entry)

        puts "\n\n"

        puts "#{license_plate} - Car added to the entry"

    end
end