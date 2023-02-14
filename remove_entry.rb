module RemoveEntry
  def remove_entry_function(license_plate)
    unless valid_license_plate?(license_plate)
      puts PRINT_STATEMENTS_HASH["valid_plate"]
      return
    end

    required_entry = get_entry_of_license_plate(license_plate)

    if required_entry.nil?
      puts PRINT_STATEMENTS_HASH["license_not_found"]
      return
    end

    puts "\n"

    puts "License plate  : #{required_entry.license_plate}"
    puts "\n"

    puts "Parking Slot   : #{required_entry.parking_slot_identifier}"
    puts "\n"

    remove_from_entry_array(license_plate)

    generate_invoice(required_entry)
  end

  def remove_from_entry_array(license_plate)
    # It was difficult for me to figure out where this entries is comming from
    entries.delete_if{ |entry| entry.license_plate == license_plate }
  end
end