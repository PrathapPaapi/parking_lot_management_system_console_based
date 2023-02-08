require_relative 'add_entry.rb'
require_relative 'remove_entry.rb'
require_relative 'find_car_invoice.rb'
require_relative 'parking_lot_validations.rb'

class ParkingLot
  include AddEntry
  include RemoveEntry
  include FindCarInvoice
  include ParkingLotValidations

  attr_accessor :entries, 
                :invoices, 
                :invoice_constant, 
                :invoice_id_reference

  # Why not a constant? (implemented)
  PARKING_LOT_SIZE = 10

  def initialize()
    @entries = []
    @invoices = []
    @invoice_constant = "PL-000"
    @invoice_id_reference = 0
  end

  def add_entry
    puts "\n\n"
    puts "Enter License Plate Number: "
    license_plate = get_input
    add_entry_call_methods(license_plate)
  end

  def remove_entry
    puts "\n\n"
    puts "Enter License Plate Number: "
    license_plate = get_input
    remove_entry_function(license_plate)
  end

  def find_required_car
    puts "\n\n"
    puts "Enter Invoice_ID: "
    invoice_id = get_input
    find_car_invoice(invoice_id)
  end

  def print_all_cars
    EntryDetails.all_cars_entry(entries)
  end

  def print_all_invoices
    # Just for discussion, Why cannot the invoices be a class variable inside InvoiceDetails?
    InvoiceDetails.all_invoices(invoices)
  end

  def get_input
    gets.chomp
  end
end