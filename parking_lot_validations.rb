

module ParkingLotValidations
    # Can create dedicated Module for parking lot
  def parking_size_check
    entries.length >= ParkingLot::PARKING_LOT_SIZE
  end

  def is_a_valid_license_plate?(license_plate)
    (/\A[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}\z/.match?(license_plate))
  end

  def has_license_plate?(license_plate)
    entries.any? { |entry| entry.license_plate == license_plate }
  end

  def get_parking_slot
    occupied_slots = entries.map(&:parking_slot_identifier)
    all_slots = (1..ParkingLot::PARKING_LOT_SIZE).to_a
    available_slots = all_slots - occupied_slots
    available_slots.first
  end

  def get_entry_of_license_plate(license_plate)
    entries.find { |entry| entry.license_plate == license_plate } 
  end
end