require 'rails_helper'

RSpec.describe "Doctors show page" do
  before(:each) do
    test_data
  end

  describe "As a visitor, when I visit a doctor's show page" do
    it "shows the doc's name, specialty, and university" do
      visit doctor_path(@doctor_1.id)
      within("#doc-info") do
        expect(page).to have_content("Name: #{@doctor_1.name}")
        expect(page).to have_content("Specialty: #{@doctor_1.specialty}")
        expect(page).to have_content("University: #{@doctor_1.university}")
      end

      visit doctor_path(@doctor_2.id)
      within("#doc-info") do
        expect(page).to have_content("Name: #{@doctor_2.name}")
        expect(page).to have_content("Specialty: #{@doctor_2.specialty}")
        expect(page).to have_content("University: #{@doctor_2.university}")
      end
    end

    it "shows the name of the hospital where they work" do
      visit doctor_path(@doctor_1.id)
      within("#hospital") do
        expect(page).to have_content("Hospital: #{@doctor_1.hospital_name}")
      end
      visit doctor_path(@doctor_2.id)
      within("#hospital") do
        expect(page).to have_content("Hospital: #{@doctor_2.hospital_name}")
      end
    end

    it "shows names of all of their patients" do
      visit doctor_path(@doctor_1.id)
      save_and_open_page
      @doctor_1.patients.each do |patient|
        within("#patients") do
          expect(page).to have_content(patient.name)
        end
      end
      expect(page).to have_no_content(@patient_3.name)
    end
  end
end