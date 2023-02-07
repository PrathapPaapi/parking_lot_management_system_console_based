require_relative "../parking_lot.rb"

describe 'test_all' do
    let(:parking_lot) { ParkingLot.new }

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
    
end

