class Admin::AppointmentsController < Admin::ApplicationController
  def index
    @appointments = appointments_repository.all
  end
end
