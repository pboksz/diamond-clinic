class HomeController < ApplicationController
  def about_us

  end

  def our_doctors
    @doctors = Doctor.all
  end

  def our_services

  end

  def clinical_research
    @clinical_trials = ClinicalTrial.all
  end

  def contact_us
    @doctors = Doctor.all
  end

  def request_appointment
    @appointment = Appointment.new
    @doctors = Doctor.all
    @clinical_trials = ClinicalTrial.all
  end

  def appointment_create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      AppointmentMailer.appointment_email(@appointment).deliver
      flash[:notice] = t('views.request_appointment.appointment.sent')

      redirect_to contact_us_path(locale)
    else
      flash[:alert] = t('views.request_appointment.appointment.error')
      @doctors = Doctor.all
      @clinical_trials = ClinicalTrial.all

      render :request_appointment
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor, :name, :email, :phone_number, :date, :time, :message)
  end
end
