class PatientsController < ApplicationController

  def destroy
    patient = Patient.find(params[:id])
    patient.doctors.delete(params[:doctor_id])
    redirect_to "/doctors/#{params[:doctor_id]}"
  end

  def index
    @patients = Patient.all
  end

end
