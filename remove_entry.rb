require './add_entry.rb'
require './constants.rb'
require './generate_invoice.rb'

include AddEntry
include GenerateInvoice

module RemoveEntry
    def remove_entry
        puts "\n\n"
        puts "Enter License Plate Number: "
        license_plate = gets.chomp
        if !license_plate_valid(license_plate)
            puts "\n\n"
            puts "Enter a valid license plate"
            return
        end

        required_entry = check_license_plate(license_plate)

        if required_entry.nil?
            puts "\n\n"
            puts "license plate not found"
            return
        end

        puts "\n"

        puts "License plate  : #{required_entry.entry_details.license_plate}"
        puts "\n"

        puts "Parking Slot   : #{required_entry.entry_details.parking_slot_identifier}"
        puts "\n"

        remove_from_entry_array(license_plate)

        remove_from_invoice_array(required_entry)

        generate_invoice(required_entry)

    end

    def check_license_plate(license_plate)
        required_entry = nil
        for entry in $global_invoice_array do 
            if entry.entry_details.license_plate == license_plate
                required_entry = entry
                break
            end
        end
        required_entry
    end

    def remove_from_entry_array(license_plate)
        ref_array = []
        for entry in $global_entry_array do
            if entry.license_plate != license_plate
                ref_array.push(entry)
            end
        end

        $global_entry_array.clear

        for entry in ref_array do
            $global_entry_array.push(entry)
        end
    end

    def remove_from_invoice_array(entry_to_be_removed)
        ref_array = []
        for entry in $global_invoice_array do
            if entry != entry_to_be_removed
                ref_array.push(entry)
            end
        end

        $global_invoice_array.clear

        for entry in ref_array do
            $global_invoice_array.push(entry)
        end
    end
end