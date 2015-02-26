class Admin::AppointmentsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @appointments = appointments_repository.all
  end
end
