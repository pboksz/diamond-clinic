class Admin::DoctorsController < Admin::ApplicationController
  def index
    @doctors = doctors_repository.all
  end

  def new
    @doctor = doctors_repository.new
  end

  def create
    @doctor = doctors_repository.create(create_params)

    if @doctor.persisted?
      redirect_to admin_doctors_path(locale)
    else
      render :new
    end
  end

  def edit
    @doctor = doctors_repository.find(params[:id])
  end

  def update
    if doctors_repository.update(params[:id], create_params)
      redirect_to admin_doctors_path(locale)
    else
      @doctor = doctors_repository.find(params[:id])
      render :edit
    end
  end

  def destroy
    doctors_repository.destroy(params[:id])
    redirect_to admin_doctors_path(locale)
  end

  private

  def create_params
    params.require(:doctor).permit(:order, :name_pl, :name_en, :specialty_pl, :specialty_en, :biography_en, :biography_pl, :photo, :photo_cache, :remove_photo)
  end
end
