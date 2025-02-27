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
      @doctor_1.patients.each do |patient|
        within("#patients") do
          expect(page).to have_content(patient.name)
        end
      end
      expect(page).to have_no_content(@patient_3.name)
      expect(page).to have_no_content(@patient_5.name)

      visit doctor_path(@doctor_2.id)
      @doctor_2.patients.each do |patient|
        within("#patients") do
          expect(page).to have_content(patient.name)
        end
      end
      expect(page).to have_no_content(@patient_1.name)
      expect(page).to have_no_content(@patient_2.name)
      expect(page).to have_no_content(@patient_5.name)
    end

    it "has a button next to each patient to remove patient from doctor's caseload" do
      visit doctor_path(@doctor_1.id)
      @doctor_1.patients.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_button("Remove from caseload")
        end
      end

      visit doctor_path(@doctor_2.id)
      @doctor_2.patients.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_button("Remove from caseload")
        end
      end
    end
    it "takes me back to show page when I click the button and the patient is no longer listed" do
      visit doctor_path(@doctor_1.id)
      within("#patient-#{@patient_4.id}") do
        expect(page).to have_content(@patient_4.name)
        click_button("Remove from caseload")
      end

      expect(current_path).to eq(doctor_path(@doctor_1.id))

      within("#patients") do
        expect(page).to have_no_content(@patient_4.name)
      end
    end
    it "does not affect a different doctor with the same patient" do
      visit doctor_path(@doctor_1.id)
      within("#patient-#{@patient_4.id}") do
        click_button("Remove from caseload")
      end

      visit doctor_path(@doctor_2.id)
      within("#patient-#{@patient_4.id}") do
        expect(page).to have_content(@patient_4.name)
      end
    end
  end
end