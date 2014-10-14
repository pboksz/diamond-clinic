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

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])

    if @doctor.update_attributes(create_params)
      redirect_to admin_doctors_path(locale)
    else
      render :edit
    end
  end

  private

  def create_params
    params.require(:doctor).permit(:name, :specialty_pl, :specialty_en, :biography_en, :biography_pl)
  end
end
