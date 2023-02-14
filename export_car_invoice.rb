# require 'prawn'
require 'prawn/table'

module ExportCarInvoice
  def export_car_invoice(invoice_id)
    required_entry = find_invoice(invoice_id)
    if required_entry.nil?
        puts PRINT_STATEMENTS_HASH["invoice_not_found"]
        return
    end

    while true
      puts PRINT_STATEMENTS_HASH["select_format"]

      file_options = {1 => "txt",
                      2 => "pdf"
                    }

      file_options.each do |opt, description|
          puts "\n #{opt}. #{description}"
      end

      puts "\n If you do not wish to export the file, type #{file_options.size()+1} \n"

      option_selected = gets.to_i

      if file_options.has_key?(option_selected)
        export_file_generation(required_entry, file_options[option_selected])
        break
      elsif option_selected == file_options.size()+1
        break
      else 
        puts "Please enter the correct option. \n"
      end
    end
  end
    
  def export_file_generation(invoice, format)
    if format == "pdf"
      pdf_name = "#{invoice.license_plate}_#{Time.new.to_s[0..-7]}"
      pdf = Prawn::Document.new
      pdf.text "Generating invoice for #{invoice.license_plate}"

      pdf.text "\n"

      pdf.table([
                 ["Invoice Number", "#{invoice.invoice_ID}"],
                 ["Entry Time", "#{invoice.entry_time}"],
                 ["Exit Time ", "#{invoice.exit_time}"],
                 ["Parked Duration", "#{invoice.parked_duration} seconds"],
                 ["Parking Charges", "Rs. #{invoice.parking_charges}"]
                ])
      
      pdf.render_file "#{pdf_name}.pdf"
    else
      File.open("#{invoice.license_plate}_#{Time.new.to_s[0..-7]}.#{format}", "w") do |f|  
        f.write ("Generating invoice for #{invoice.license_plate} \n\n")

        f.write ("Invoice Number  : #{invoice.invoice_ID} \n")

        f.write ("Entry Time      : #{invoice.entry_time} \n")
        
        f.write ("Exit Time       : #{invoice.exit_time} \n")
        
        f.write ("Parked Duration : #{invoice.parked_duration} seconds \n")

        f.write ("Parking Charges : Rs. #{invoice.parking_charges} \n")
      end
    end
  end
end