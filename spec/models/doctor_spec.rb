require 'rails_helper'

RSpec.describe Doctor do
  it {should belong_to :hospital}
  it {should have_many :doctor_patients}
  it {should have_many(:patients).through(:doctor_patients)}
  
  describe "instance methods" do
    before(:each) do
      test_data
    end
    describe "#hospital_name" do
      it "returns the name of the hospital they work at" do
        expect(@doctor_1.hospital_name).to eq("Seattle Grace")
        expect(@doctor_2.hospital_name).to eq("Seattle Grace")
      end
    end
  end
end
