require './generate_invoice.rb'

include GenerateInvoice

module AllInvoices
    def all_invoices
        for entry in $global_invoice_array do
            generate_invoice(entry)
        end
    end
end