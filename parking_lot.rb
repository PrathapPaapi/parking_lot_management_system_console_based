require_relative 'add_entry.rb'
require_relative 'remove_entry.rb'
require_relative 'find_car.rb'
require_relative 'validations.rb'

class ParkingLot
    include AddEntry
    include RemoveEntry
    include FindCarAndInvoice
    include Validations

    attr_accessor :entries , :invoices, :invoice_constant, :invoice_id_reference

    @@parking_lot_size = 10

    def self.parking_lot_size
        @@parking_lot_size
    end


    def initialize()
        @entries = []
        @invoices = []
        @invoice_constant = "PL-000"
        @invoice_id_reference = 0
    end

    def add_entry
        puts "\n\n"
        puts "Enter License Plate Number: "
        license_plate = gets.chomp
        add_entry_call_methods(license_plate)
    end

    def remove_entry
        puts "\n\n"
        puts "Enter License Plate Number: "
        license_plate = gets.chomp
        remove_entry_function(license_plate)
    end

    def find_required_car
        puts "\n\n"
        puts "Enter Invoice_ID: "
        invoice_id = gets.chomp
        find_car_invoice(invoice_id)
    end

    def print_all_cars
        EntryDetails.all_cars_entry(entries)
    end

    def print_all_invoices
        InvoiceDetails.all_invoices(invoices)
    end

end