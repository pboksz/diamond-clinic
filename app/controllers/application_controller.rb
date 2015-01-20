class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  helper_method :locale
  def locale
    params[:locale]
  end

  helper_method :current_admin
  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
  end
end
