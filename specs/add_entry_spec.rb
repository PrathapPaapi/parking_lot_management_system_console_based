require_relative "../parking_lot.rb"

describe "test_all" do
    let(:parking_lot) { ParkingLot.new }

    describe "add_entry_specs" do
        it "demonstrates that is_a_valid_license_plate? function is being invoked in add_entry_call_methods function" do
            expect(parking_lot).to receive(:is_a_valid_license_plate?).with("KA02KB0001")

            parking_lot.add_entry_call_methods("KA02KB0001")
        end

        it "demonstrates that has_license_plate? function is being invoked in add_entry_call_methods function" do
            expect(parking_lot).to receive(:has_license_plate?).with("KA02KB0002")

            parking_lot.add_entry_call_methods("KA02KB0002")
        end

        it "demonstrates that get_parking_slot function is being invoked in add_entry_call_methods function" do
            expect(parking_lot).to receive(:get_parking_slot)

            parking_lot.add_entry_call_methods("KA02KB0003")
        end

        it "demonstrates that add_entry_call_methods adds a new entry" do
            expect(parking_lot.add_entry_call_methods("KA02KB0004")).to eq(parking_lot.entries.last)
        end

    end
end