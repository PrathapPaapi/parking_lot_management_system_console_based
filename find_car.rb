require_relative './generate_invoice.rb'
require 'colorize'

include GenerateInvoice

# Module name and file name do not match
# If the module name is find car, why do we have a method to find Invoice?
module FindCarAndInvoice
    def find_car_invoice(invoice_id)
        required_entry = find_invoice(invoice_id)
        if required_entry.nil?
            puts "\n\n"
            puts "Invoice ID not found".red
            return
        end

        print_invoice(required_entry)
    end

    def find_invoice(invoice_id)
        # required_entry = nil
        # for entry in invoices do
        #     if entry.invoice_ID == invoice_id
        #         required_entry = entry
        #         break
        #     end
        # end
        # required_entry

        invoices.find {|invoice| invoice.invoice_ID == invoice_id}
    end
end