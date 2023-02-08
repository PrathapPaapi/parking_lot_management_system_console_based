require_relative './generate_invoice.rb'
require 'colorize'

include GenerateInvoice

# Module name and file name do not match (changed)
# If the module name is find car, why do we have a method to find Invoice? ()
module FindCarInvoice
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
    invoices.find {|invoice| invoice.invoice_ID == invoice_id}
  end
end