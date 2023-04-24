require 'rails_helper'

RSpec.describe Patient do
  it {should have_many :doctor_patients}
  it {should have_many(:doctors).through(:doctor_patients)}
end

describe "class methods" do
  before(:each) do
    test_data
  end
  describe "adult_patients" do
    it "returns an array of patients 18 or older alphabetized by name" do
      expect(Patient.adult_patients).to eq([@patient_3, @patient_4, @patient_1, @patient_2])
    end
  end
end