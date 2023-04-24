class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_and_count
    doctors.joins(:patients)
           .select("doctors.*, COUNT(patients.id) AS patient_count")
           .order("patient_count DESC")
           .group(:id)
  end
end
