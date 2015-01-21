class HomeController < ApplicationController
  def about_us

  end

  def our_doctors
    @doctors = doctors_repository.all
  end

  def our_services

  end

  def clinical_research
    @clinical_trials = clinic_trials_repository.all
  end

  def contact_us
    @doctors = doctors_repository.all
  end

  def request_appointment
    @appointment = appointments_repository.new
    @doctors = doctors_repository.all
    @clinical_trials = clinic_trials_repository.all
  end

  def appointment_create
    @appointment = appointments_repository.create(appointment_params)

    if @appointment.persisted?
      AppointmentMailer.appointment_email(@appointment).deliver
      flash[:notice] = t('views.request_appointment.appointment.sent')

      redirect_to contact_us_path(locale)
    else
      flash[:alert] = t('views.request_appointment.appointment.error')
      @doctors = doctors_repository.all
      @clinical_trials = clinic_trials_repository.all

      render :request_appointment
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor, :name, :email, :phone_number, :date, :time, :message)
  end
end
