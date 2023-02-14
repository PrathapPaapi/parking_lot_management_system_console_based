require_relative "../parking_lot.rb"

describe "test_all" do
    let(:parking_lot) { ParkingLot.new }

    describe "remove_entry_specs" do
        before do
            parking_lot.add_entry_call_methods("KA02KB0001")
        end
        it "demonstrates that valid_license_plate? function is being invoked in remove_entry_function function" do
            expect(parking_lot).to receive(:valid_license_plate?).with("KA02KB0001")

            parking_lot.remove_entry_function("KA02KB0001")
        end

        it "demonstrates that get_entry_of_license_plate function is being invoked in remove_entry_function function" do
            expect(parking_lot).to receive(:get_entry_of_license_plate).with("KA02KB0001")

            parking_lot.remove_entry_function("KA02KB0001")
        end

        it "demonstrates that remove_from_entry_array function is being invoked in remove_entry_function function" do
            expect(parking_lot).to receive(:remove_from_entry_array).with("KA02KB0001")

            parking_lot.remove_entry_function("KA02KB0001")
        end

        it "demonstrates that generate_invoice function is being invoked in remove_entry_function function" do
            expect(parking_lot).to receive(:generate_invoice).with(parking_lot.get_entry_of_license_plate("KA02KB0001"))

            parking_lot.remove_entry_function("KA02KB0001")
        end

        it "demonstrates that remove_from_entry_array function removes the entry from entries array" do
            entry = parking_lot.get_entry_of_license_plate("KA02KB0001")
            new_array = [entry]
            reference_array_before_remove = parking_lot.entries.clone
            reference_array_after_remove = parking_lot.remove_from_entry_array("KA02KB0001")

            expect(reference_array_before_remove - reference_array_after_remove).to eq(new_array)
        end

    end
end