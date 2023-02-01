require './generate_invoice.rb'

include GenerateInvoice

module FindCarAndInvoice
    def find_car_and_invoice
        puts "\n\n"
        puts "Enter Invoice_ID: "
        invoice_id = gets.chomp
        
        required_entry = find_invoice(invoice_id)
        if required_entry.nil?
            puts "Invoice ID not found"
            return
        end

        puts "\n\n"

        puts "License_plate: #{required_entry.entry_details.license_plate}"
        puts "Parking slot number: #{required_entry.entry_details.parking_slot_identifier}"

        generate_invoice(required_entry)
    end

    def find_invoice(invoice_id)
        required_entry = nil
        for entry in $global_invoice_array do
            if entry.invoice_ID == invoice_id
                required_entry = entry
                break
            end
        end
        required_entry
    end
end