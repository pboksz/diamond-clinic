class Admin::ApplicationController < ApplicationController
  before_action :authenticate!

  helper_method :back_path
  def back_path(target_locale = locale)
    request.env['HTTP_REFERER'] || admin_appointments_path(target_locale)
  end

  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  def authenticate!
    redirect_to admin_login_path(locale) unless current_admin
  end
end
