class Admin::AppointmentsController < Admin::BaseController
  def index
    @appointments = appointments_repository.all
  end
end
