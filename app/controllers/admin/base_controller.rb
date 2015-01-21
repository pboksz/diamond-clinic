class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  def authenticate_admin!
    redirect_to admin_login_path(locale) unless current_admin
  end

  helper_method :back_path
  def back_path(target_locale = locale)
    request.env['HTTP_REFERER'] || admin_appointments_path(target_locale)
  end

  def create_admin_session(admin)
    @current_admin = admin
    session[:admin_id] = admin.id.to_s
  end

  def destroy_admin_session
    @current_admin = nil
    session[:admin_id] = nil
  end
end
