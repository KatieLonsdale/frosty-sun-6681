require 'rails_helper'

RSpec.describe "Patients index page" do
  before(:each) do
    test_data
    visit patients_path
  end
  describe "As a visitor, when I visit the patient index page" do
    it "has all the names of the patients over 18" do
      within("#patients") do
        Patient.adult_patients.each do |ap|
          expect(page).to have_content(ap.name)
        end 
        expect(page).to have_no_content(@patient_5.name)
      end
    end
    it "lists all patients alphabetically" do
      within("#patients") do
        expect(@patient_3.name).to appear_before(@patient_4.name)
        expect(@patient_4.name).to appear_before(@patient_1.name)
        expect(@patient_1.name).to appear_before(@patient_2.name)
      end
    end
  end
end