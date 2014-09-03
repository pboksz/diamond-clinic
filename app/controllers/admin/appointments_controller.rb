class Admin::AppointmentsController < Admin::ApplicationController
  def index
    @appointments = Appointment.desc(:created_at)
  end
end
