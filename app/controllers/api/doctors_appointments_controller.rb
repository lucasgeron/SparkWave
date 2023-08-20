class Api::DoctorsAppointmentsController < ApplicationController
  def register_admission
    DocktorAppointmentManagement::RecordPatientArrivalsAndRepartures.perform(
      docktors_appointment_params[:token],
      docktors_appointment_params[:category],
      'entry',
      { success: success_callback, error: error_callback }
    )
  end

  def register_patient_output
    DocktorAppointmentManagement::RecordPatientArrivalsAndRepartures.perform(
      docktors_appointment_params[:token],
      docktors_appointment_params[:category],
      'departure',
      { success: success_callback, error: error_callback }
    )
  end

  private

  def docktors_appointment_params
    params.require(:doctors_appointment).permit(:token, :category)
  end

  def success_callback
    lambda do |caller|
      render json: { message: caller }, status: :ok
    end
  end

  def error_callback
    lambda do |caller|
      render json: { message: caller.errors }, status: :unprocessable_entity
    end
  end
end
