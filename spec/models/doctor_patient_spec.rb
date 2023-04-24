require 'rails_helper'

RSpec.describe DoctorPatient do
  it {should belong_to :doctor}
  it {should belong_to :patient}
  
  describe "instance methods" do
    before(:each) do
      test_data
    end
    describe "#patient_name" do
      it "returns the name of the patient" do
        expect(@mcdreamy_steve.patient_name).to eq("Steve")
        expect(@mcdreamy_tracy.patient_name).to eq("Tracy")
        expect(@mcsteamy_granny.patient_name).to eq("Granny")
      end
    end
  end
end