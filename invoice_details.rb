require_relative 'generate_invoice.rb'

include GenerateInvoice

class InvoiceDetails

  attr_accessor :license_plate, 
                :invoice_ID, 
                :entry_time, 
                :exit_time, 
                :parked_duration, 
                :parking_charges

  def initialize(license_plate, 
                 invoice_ID, 
                 entry_time, 
                 exit_time,
                 parked_duration, 
                 parking_charges
                )
                
    @license_plate = license_plate 
    @invoice_ID = invoice_ID
    @entry_time = entry_time
    @exit_time = exit_time
    @parked_duration = parked_duration
    @parking_charges = parking_charges
  end

  def self.all_invoices(invoices)
    if invoices.size==0
      puts PRINT_STATEMENTS_HASH["no_invoices_found"]
    end
    
    invoices.each do |invoice|
      print_invoice(invoice)
    end
  end
end


