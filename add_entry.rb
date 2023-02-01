require './entry.rb'
require './invoice.rb'
require './constants.rb'

module AddEntry

    def take_entry

        if parking_size_check
            puts "\n\n"
            puts "Parking lot size limit reached: #{$parking_lot_size}"
            return
        end

        puts "\n\n"
        puts "Enter License Plate Number: "
        license_plate = gets.chomp
        call_methods(license_plate)
    end

    def call_methods(license_plate)

        if !license_plate_valid(license_plate)
            puts "\n\n"
            puts "Enter a valid license plate"
            return
        end

        if duplicates_plates_check(license_plate)
            puts "\n\n"
            puts "License Plate exists in the record"
            return
        end

        parking_slot = get_parking_slot

        new_entry = EntryDetails.new(license_plate, parking_slot, Time.new)

        $global_entry_array.push(new_entry)

        new_invoice_id = $invoice_constant + $invoice_id_reference.to_s

        $invoice_id_reference += 1

        new_invoice = InvoiceDetails.new(new_entry, new_invoice_id)

        $global_invoice_array.push(new_invoice)

        puts "\n\n"

        puts "#{license_plate} - Car added to the entry"

    end

    def parking_size_check
        flag = false
        if $global_entry_array.length >= $parking_lot_size
            flag = true
        end
        flag
    end

    def license_plate_valid(license_plate)
        plate_valid = (/\A[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}\z/.match(license_plate))
    end

    def duplicates_plates_check(license_plate)
        duplicates_present = false
        for i in 0..$global_entry_array.length-1
            if $global_entry_array[i].license_plate == license_plate
                duplicates_present =  true
            end
        end
        duplicates_present
    end

    def get_parking_slot
        for slot in 1..$parking_lot_size do
            j = 0
            for entry in $global_entry_array do
                if entry.parking_slot_identifier == slot
                    break
                end
                j += 1
            end
            if j==$global_entry_array.length
                return slot
            end
        end
    end



end