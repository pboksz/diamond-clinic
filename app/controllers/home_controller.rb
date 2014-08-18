class HomeController < ApplicationController
  def index

  end

  def about_us

  end

  def contact_us
    @doctors = Doctor.all
    @appointment = Appointment.new
  end
end
