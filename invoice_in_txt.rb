class InvoiceInTxt
  def self.generate(invoice)
    File.open("#{invoice.license_plate}_#{Time.new.to_s[0..-7]}.txt", "w") do |f|
      f.write ("Generating invoice for #{invoice.license_plate} \n\n")
  
      f.write ("Invoice Number  : #{invoice.invoice_ID} \n")
  
      f.write ("Entry Time      : #{invoice.entry_time} \n")
  
      f.write ("Exit Time       : #{invoice.exit_time} \n")
  
      f.write ("Parked Duration : #{invoice.parked_duration} seconds \n")
  
      f.write ("Parking Charges : Rs. #{invoice.parking_charges} \n")
    end
  end
end

