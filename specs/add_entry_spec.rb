require_relative '../remove_entry.rb'
require_relative '../add_entry.rb'
require_relative '../entry_details.rb'
require_relative '../validations.rb'
require_relative "../parking_lot.rb"
require 'pry'

include RemoveEntry
include AddEntry
include Validations

describe 'test_all' do
    parking_lot = ParkingLot.new

    describe "validations verification" do

        it "should demonstrate that whether space is left in parking lot or not" do
            expect(parking_lot.parking_size_check).to eq(false)
        end

        it "should demonstrate the working of license plate validation" do
            expect(parking_lot.license_plate_valid("KA02KB0001")).to eq(true)
        end

        it "should demonstrate whether number plate is present or not" do
            entry = EntryDetails.new("KA02KB0001", 1, Time.now)
            entries = [entry]
            allow_any_instance_of(ParkingLot).to receive(:entries) {entries}
            expect(parking_lot.duplicates_plates_check("KA02KB0001")).to eq(true)
        end

        it "should demonstrate that get_parking_slot returns parking slot number" do
            expect(parking_lot.get_parking_slot).to eq(1)
        end

        it "should demonstrate that check_license_plate returns entry if present or nil if not present" do
            parking_lot.add_entry_call_methods("KA02KB0001")
            expect(parking_lot.check_license_plate("KA02KB0001")).to eq(parking_lot.entries.first)
        end
    end
    
    # describe "remove_entry_check" do
    
        # present = false
        # if duplicates_plates_check("KA02KB0007")
        #     present = true
        #     remove_entry_function("KA02KB0007", false)
        # end
    
        # before (:each) do
        #     add_entry_call_methods("KA02KB0009", false)
        # end
    
        # after (:each) do
        #     if present
        #         add_entry_call_methods("KA02KB0009", false)
        #     end
        # end
    
        # it "should demonstrate that funtion returns true if entry is removed" do
        #     expect(remove_entry_function("KA02KB0007", false)).to eq(true)
        # end
    
    # end

end

