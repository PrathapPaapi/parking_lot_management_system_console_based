require_relative "../parking_lot.rb"

describe "find car specs" do
    let(:parking_lot) { ParkingLot.new }

    let(:new_invoice) { InvoiceDetails.new("KA02KB0001", "PL-0000", 
        "11:20:32", "11:20:45", 13, parking_lot.get_parking_charges(13)) }

    before do 
        parking_lot.invoices.push(new_invoice)
    end

    it "demonstrates the working of find_car_invoice function" do
        expect(parking_lot.find_car_invoice("PL-0000")).to eq("PL-0000")
    end

    it "demonstrates the working of find_invoice function" do
        expect(parking_lot.find_invoice("PL-0000")).to eq(new_invoice)
    end

    it "demonstrates that find_invoice function is being invoked in find_car_invoice function" do
        expect(parking_lot).to receive(:find_invoice).with("PL-0000")

        parking_lot.find_car_invoice("PL-0000")
    end
end