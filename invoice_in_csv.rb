require 'csv'

class InvoiceInCsv
  def self.generate(invoice)
    CSV.open("#{invoice.license_plate}_#{Time.new.to_s[0..-7]}.csv", "w", 
      :write_headers=> true,
      :headers => ["Invoice Number", "Entry Time", "Exit Time", "Parked Duration", "Parking Charges"]) do |csv|
      csv << [invoice.invoice_ID, invoice.entry_time, invoice.exit_time, invoice.parked_duration, invoice.parking_charges]
    end
  end
end