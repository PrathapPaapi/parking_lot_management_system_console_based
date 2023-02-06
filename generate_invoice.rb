module GenerateInvoice
    def generate_invoice(required_entry)

        new_invoice_id = invoice_constant + self.invoice_id_reference.to_s

        self.invoice_id_reference += 1

        exit_time = Time.now

        parked_duration = (exit_time - required_entry.entry_time)

        parking_charges = get_parking_charges(parked_duration)

        new_invoice = InvoiceDetails.new(required_entry.license_plate, new_invoice_id, 
                                    required_entry.entry_time, exit_time, parked_duration, parking_charges)

        invoices.push(new_invoice)

        print_invoice(new_invoice)

    end

    def get_parking_charges(parked_duration)
        case parked_duration
            when 0...10 
                then 100
            when 10...30
                then 200
            when 30...60
                then 300
            else
                500
        end        
    end

    def print_invoice(invoice)
        puts "****************************"
        puts "\n"
        puts "Generating invoice for #{invoice.license_plate}"
        puts "\n"

        puts "Invoice Number  : #{invoice.invoice_ID}"

        puts "Entry Time      : #{invoice.entry_time}"
        
        puts "Exit Time       : #{invoice.exit_time}"
        
        puts "Parked Duration : #{invoice.parked_duration} seconds"

        

        puts "Parking Charges : Rs. #{invoice.parking_charges}"
    end

end