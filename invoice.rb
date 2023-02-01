require './entry.rb'

class InvoiceDetails
    attr_accessor :entry_details, :invoice_ID
    def initialize(entry_details, invoice_ID)
        @entry_details = entry_details
        @invoice_ID = invoice_ID
    end
end


