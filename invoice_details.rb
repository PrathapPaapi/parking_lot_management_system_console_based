require_relative './entry_details.rb'
require_relative 'generate_invoice.rb'
require 'colorize'

include GenerateInvoice

class InvoiceDetails
    attr_accessor :license_plate, :invoice_ID, :entry_time, :exit_time, :parked_duration, :parking_charges
    def initialize(license_plate, invoice_ID, entry_time, exit_time, parked_duration, parking_charges)
        @license_plate = license_plate 
        @invoice_ID = invoice_ID
        @entry_time = entry_time
        @exit_time = exit_time
        @parked_duration = parked_duration
        @parking_charges = parking_charges
    end

    def self.all_invoices(invoices)
        if invoices.size==0
            puts "\n\n"
            puts "No invoices found".red
        end

        for entry in invoices do
            print_invoice(entry)
        end
    end
end


