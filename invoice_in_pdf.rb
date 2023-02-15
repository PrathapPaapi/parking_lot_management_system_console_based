require "prawn/table"

class InvoiceInPdf
  def self.generate(invoice)
    pdf_name = "#{invoice.license_plate}_#{Time.new.to_s[0..-7]}"
    pdf = Prawn::Document.new
    pdf.text "Generating invoice for #{invoice.license_plate}"
  
    pdf.text "\n"
  
    pdf.table([
      ["Invoice Number", "#{invoice.invoice_ID}"],
      ["Entry Time", "#{invoice.entry_time}"],
      ["Exit Time ", "#{invoice.exit_time}"],
      ["Parked Duration", "#{invoice.parked_duration} seconds"],
      ["Parking Charges", "Rs. #{invoice.parking_charges}"],
    ])
  
    pdf.render_file "#{pdf_name}.pdf"
  end
end

