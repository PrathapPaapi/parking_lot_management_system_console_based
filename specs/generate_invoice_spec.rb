require_relative "../parking_lot.rb"


describe "Generate Invoice specs" do
    let(:parking_lot) { ParkingLot.new }
    it "demonstrates the working of generate_invoice function" do
        new_entry = EntryDetails.new("KA02KB0001", "1", Time.new)

        expect(parking_lot.generate_invoice(new_entry)).to eq("PL-0000")
    end

    it "demonstrates the working of parking_charges function" do
        expect(parking_lot.get_parking_charges(4)).to eq(100)
        expect(parking_lot.get_parking_charges(10)).to eq(200)
        expect(parking_lot.get_parking_charges(30)).to eq(300)
        expect(parking_lot.get_parking_charges(60)).to eq(500)
    end

    it "demonstrates the working of print_invoice function" do
        new_invoice = InvoiceDetails.new("KA02KB0001", "PL-0000", 
            "11:20:32", "11:20:45", 13, parking_lot.get_parking_charges(13))

        expect(parking_lot.print_invoice(new_invoice)).to eq("PL-0000")
    end
end