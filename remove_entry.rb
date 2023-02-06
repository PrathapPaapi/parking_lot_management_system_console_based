require_relative 'validations.rb'
require_relative './generate_invoice.rb'
require 'colorize'

include Validations
include GenerateInvoice

module RemoveEntry

    def remove_entry_function(license_plate)
        unless license_plate_valid(license_plate)
            puts "\n\n"
            puts "Enter a valid license plate".red
            return
        end

        required_entry = check_license_plate(license_plate)

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
        # ref_array = []
        # for entry in entries do
        #     if entry.license_plate != license_plate
        #         ref_array.push(entry)
        #     end
        # end

        # entries.clear

        # for entry in ref_array do
        #     entries.push(entry)
        # end

        entries.delete_if{ |entry| entry.license_plate}
    end
end