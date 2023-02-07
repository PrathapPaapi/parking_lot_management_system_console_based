
require_relative "../parking_lot.rb"

describe "test_all" do
    let(:parking_lot) { ParkingLot.new }

    describe "ParkingLot_functions_specs" do

        let(:new_invoice) { InvoiceDetails.new("KA02KB0001", "PL-0000", 
            "11:20:32", "11:20:45", 13, parking_lot.get_parking_charges(13)) }
            
        before do 
            parking_lot.invoices.push(new_invoice)
        end

        it "should demonstrate that add_entry function takes input and stores the entry" do
            allow_any_instance_of(ParkingLot).to receive(:get_input) {"KA02KB0001"}

            parking_lot.add_entry

            expect(parking_lot.entries.size).to eq(1)
        end

        it "should demonstrate that remove_entry function takes input and removes the entry if found" do
            allow_any_instance_of(ParkingLot).to receive(:get_input) {"KA02KB0001"}

            parking_lot.remove_entry

            expect(parking_lot.entries.size).to eq(0)
        end

        it "should demonstrate that find_required_car function takes input and returns the required invoice if found" do
            allow_any_instance_of(ParkingLot).to receive(:get_input) {"PL-0000"}

            expect(parking_lot.find_required_car).to eq("PL-0000")
        end
    end

end