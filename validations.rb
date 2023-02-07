

module Validations
    # Can create dedicated Module for parking lot
    def parking_size_check
        entries.length >= ParkingLot.parking_lot_size
    end

    def license_plate_valid(license_plate)
        (/\A[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}\z/.match?(license_plate))
    end

    def duplicates_plates_check(license_plate)
        # duplicates_present = false
        # for i in 0..entries.length-1
        #     if entries[i].license_plate == license_plate
        #         duplicates_present =  true
        #     end
        # end
        # duplicates_present

        entries.any? { |entry| entry.license_plate == license_plate }
    end

    def get_parking_slot
        # for slot in 1..ParkingLot.parking_lot_size do
        #     j = 0
        #     for entry in entries do
        #         if entry.parking_slot_identifier == slot
        #             break
        #         end
        #         j += 1
        #     end
        #     if j==entries.length
        #         return slot
        #     end
        # end

        occupied_slots = entries.map(&:parking_slot_identifier)
        all_slots = (1..ParkingLot.parking_lot_size).to_a
        available_slots = all_slots - occupied_slots
        available_slots.first

    end

    def check_license_plate(license_plate)
        # required_entry = nil
        # for entry in entries do 
        #     if entry.license_plate == license_plate
        #         required_entry = entry
        #         break
        #     end
        # end
        # required_entry

        # entries.find do |entry|
        #     entry.license_plate == license_plate
        # end

        entries.find { |entry| entry.license_plate == license_plate } 
    end
end