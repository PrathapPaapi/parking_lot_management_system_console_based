require_relative "../parking_lot.rb"

describe "test_all" do
    let(:parking_lot) { ParkingLot.new }

    describe "add_entry_specs" do
        it "demonstrates that valid_license_plate? function is being invoked in add_entry_call_methods function" do
            expect(parking_lot).to receive(:valid_license_plate?).with("KA02KB0001")

            parking_lot.add_entry_call_methods("KA02KB0001")
        end

        it "demonstrates that license_plate_present? function is being invoked in add_entry_call_methods function" do
            expect(parking_lot).to receive(:license_plate_present?).with("KA02KB0002")

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