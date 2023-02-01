module AllCarsEntry
    def all_cars_entry
        for entry in $global_entry_array do
            puts "\n"
            puts "license_plate  : #{entry.license_plate}"
            puts "Parking slot   : #{entry.parking_slot_identifier}"
            puts "\n\n"
        end
    end
end