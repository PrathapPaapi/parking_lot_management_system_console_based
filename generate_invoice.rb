module GenerateInvoice
    def generate_invoice(required_entry)

        exit_time = Time.now

        parked_duration = (exit_time - required_entry.entry_details.entry_time)

        puts "****************************"
        puts "\n"
        puts "Generating invoice for #{required_entry.entry_details.license_plate}"
        puts "\n"

        puts "Invoice Number  : #{required_entry.invoice_ID}"

        puts "License Plate   : #{required_entry.entry_details.license_plate}"

        puts "Entry Time      : #{required_entry.entry_details.entry_time}"
        
        puts "Exit Time       : #{exit_time}"
        
        puts "Parked Duration : #{parked_duration} seconds"

        parking_charges = get_parking_charges(parked_duration)

        puts "Parking Charges : Rs. #{parking_charges}"

    end

    def get_parking_charges(parked_duration)
        parking_charges = 0

        if parked_duration < 10
            parking_charges = 100
        end

        if parked_duration >= 10 && parked_duration < 30
            parking_charges = 200
        end

        if parked_duration >= 30 && parked_duration < 60
            parking_charges = 300
        end

        if parked_duration >= 60
            parking_charges = 400
        end

        parking_charges
            
    end

end