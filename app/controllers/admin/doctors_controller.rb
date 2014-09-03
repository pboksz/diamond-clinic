class Admin::DoctorsController < Admin::ApplicationController
  def index
    @doctors = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(create_params)

    if @doctor.save
      redirect_to admin_doctors_path(locale)
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:doctor).permit(:title, :first_name, :last_name, :specialty, :biography_en, :biography_pl)
  end
end
