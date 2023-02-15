Dir["invoice_in_*.rb"].each do |format_file|
  require_relative format_file
end

module ExportCarInvoice
  def export_car_invoice(invoice_id)
    required_entry = find_invoice(invoice_id)
  
    if required_entry.nil?
        puts PRINT_STATEMENTS_HASH["invoice_not_found"]
        return
    end

    format_files_array = Dir["invoice_in_*.rb"]
  
    file_options = {}
  
    format_files_array.each do |ele|
      file_options.store(ele[11..-4], ele[0..-4])
    end
  
    while true
      puts PRINT_STATEMENTS_HASH["select_format"]
  
      file_options.each do |key, value|
        puts key
      end
  
      puts "\n If you do not wish to export the file, type 'exit' \n\n"
  
      option_selected = gets.chomp
  
      if file_options.has_key?(option_selected)
        class_name = Object.const_get(file_options[option_selected].split("_").map(&:capitalize).join())
        class_name.generate(required_entry)
        break
      elsif option_selected == "exit"
        break
      else 
        puts "\n\n Please type the correct option. \n"
      end
    end
  end
end