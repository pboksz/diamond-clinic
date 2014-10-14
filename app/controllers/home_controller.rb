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
  end

  def appointment_create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      AppointmentMailer.appointment_email(@appointment).deliver
      flash[:notice] = 'Your appointment request has been sent. You will receive a call or email shortly to finalize the appointment.'

      redirect_to contact_us_path(locale)
    else
      flash[:alert] = 'There was an error sending your appointment request. Please correct the errors and retry.'
      @doctors = Doctor.all

      render :contact_us
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:doctor, :name, :email, :phone_number, :date, :time, :message)
  end
end
