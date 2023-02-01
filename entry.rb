class EntryDetails
    attr_accessor :license_plate, :parking_slot_identifier, :entry_time
    def initialize(license_plate, parking_slot_identifier, entry_time)
        @license_plate = license_plate
        @parking_slot_identifier = parking_slot_identifier 
        @entry_time = entry_time
    end
end

car1 = EntryDetails.new("KA02KB0803", 1, Time.new)

puts car1.parking_slot_identifier