class DoctorPatientsController < ApplicationController
  def destroy
    dp = DoctorPatient.find(params[:id])
    dp.destroy
    redirect_to doctor_path(params[:doctor_id])
  end
end