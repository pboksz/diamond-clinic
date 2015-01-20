class Admin::SessionsController < Admin::ApplicationController
  skip_before_action :authenticate_admin!

  def new
    if current_admin
      redirect_to admin_appointments_path(locale)
    else
      @admin = Admin.new
      render :new
    end
  end

  def create
    admin = Admin.where(email: create_params[:email]).first

    if admin && admin.valid_password?(create_params[:password])
      create_admin_session(admin)
      redirect_to admin_appointments_path(locale)
    else
      @admin = Admin.new
      render :new
    end
  end

  def destroy
    destroy_admin_session
    redirect_to root_path(locale)
  end

  private

  def create_params
    params.require(:admin).permit(:email, :password)
  end
end
