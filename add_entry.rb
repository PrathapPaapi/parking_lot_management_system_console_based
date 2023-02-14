module AddEntry

  def add_entry_call_methods(license_plate)
    unless valid_license_plate?(license_plate)
      puts PRINT_STATEMENTS_HASH["valid_plate"]
      return
    end

    # Why is this called plates?
    # Any better name? (tried)
    if license_plate_present?(license_plate)
      puts PRINT_STATEMENTS_HASH["license_exists"]
      return
    end

    parking_slot = get_parking_slot

    new_entry = EntryDetails.new(license_plate, parking_slot, Time.new)

    entries.push(new_entry)

    puts PRINT_STATEMENTS_HASH["car_added"].call(license_plate)

    new_entry
  end
end