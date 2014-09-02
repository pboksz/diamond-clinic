class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def index

  end

  def appointments
    @appointments = Appointment.desc(:created_at)
  end

  def doctors
    @doctors = Doctor.all
  end

  def doctors_new
    @doctor = Doctor.new
  end

  def doctors_create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to admin_doctors_path(locale)
    else
      render :doctors_new
    end
  end

  def admins
    @admins = Admin.all
  end

  def admins_new
    @admin = Admin.new
  end

  def admins_create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to admin_admins_path(locale)
    else
      render :admins_new
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty, :biography_en, :biography_pl)
  end

  def admin_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
