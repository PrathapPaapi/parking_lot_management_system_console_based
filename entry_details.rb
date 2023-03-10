class EntryDetails

  attr_accessor :license_plate, 
                :parking_slot_identifier, 
                :entry_time

  def initialize(license_plate, 
                 parking_slot_identifier, 
                 entry_time
                )
                
    @license_plate = license_plate
    @parking_slot_identifier = parking_slot_identifier 
    @entry_time = entry_time
  end

  def self.all_cars_entry(entries)
    if entries.size==0
      puts PRINT_STATEMENTS_HASH["no_cars_present"]
      return
    end

    entries.each do |entry|
      puts "\n"
      puts "License_plate  : #{entry.license_plate}"
      puts "Parking slot   : #{entry.parking_slot_identifier}"
      puts "\n"
    end
  end
end