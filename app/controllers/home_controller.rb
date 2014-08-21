class HomeController < ApplicationController
  def index

  end

  def about_us

  end

  def our_doctors
    @doctors = Doctor.all
  end

  def services

  end

  def clinical_research

  end

  def contact_us
    @doctors = Doctor.all
    @appointment = Appointment.new
  end
end
