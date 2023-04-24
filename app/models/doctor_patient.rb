class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def patient_name
    patient.name
  end
end