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
    admin = Admin.where(email: params[:admin][:email]).first

    if admin && admin.valid_password?(params[:admin][:password])
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

  def create_admin_session(admin)
    @current_admin = admin
    session[:admin_id] = admin.id.to_s
  end

  def destroy_admin_session
    @current_admin = nil
    session[:admin_id] = nil
  end
end
