require 'rails_helper'

RSpec.describe "Hospitals show page" do
  before(:each) do
    test_data
  end
  describe "As a visitor, when I visit a hospital's show page" do
    it "shows me the hospital's name" do
      visit hospital_path(@hospital_1)
      within("#hospital-info") do
        expect(page).to have_content(@hospital_1.name)
      end

      visit hospital_path(@hospital_2)
      within("#hospital-info") do
        expect(page).to have_content(@hospital_2.name)
      end
    end
    it "shows me all doctors that work at this hospital and their number of patients" do
      visit hospital_path(@hospital_1)
      @hospital_1.doctors.each do |doc|
        within("#doctor-#{doc.id}") do
          expect(page).to have_content(doc.name)
          expect(page).to have_content(doc.patients.count)
        end
      end
    end
    it "the list of doctors is ordered from most patients to least" do
      visit hospital_path(@hospital_1)

      expect(@doctor_1.name).to appear_before(@doctor_2.name)
      expect(@doctor_2.name).to appear_before(@doctor_3.name)
    end
  end
end