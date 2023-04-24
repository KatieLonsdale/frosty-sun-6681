require 'rails_helper'

RSpec.describe Hospital do
  it {should have_many :doctors}
end

describe "instance methods" do
  before(:each) do
    test_data
  end
  describe "#doctors_and_count" do
    it "returns an array of doctors ordered by patient count desc" do
      expect(@hospital_1.doctors_and_count).to eq([@doctor_1, @doctor_2, @doctor_3])
    end
  end
end