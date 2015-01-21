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
    @current_admin ||= admins_repository.find(session[:admin_id]) if session[:admin_id]
  end

  def current_admin_repository
    @current_admin_repository ||= CurrentAdminRepository.new(current_admin)
  end

  def admins_repository
    @admins_repository ||= AdminsRepository.new(Admin)
  end

  def clinic_trials_repository
    @clinical_trials_repository ||= DefaultRepository.new(ClinicalTrial)
  end

  def doctors_repository
    @doctors_repository ||= DefaultRepository.new(Doctor)
  end

  def appointments_repository
    @appointments_repository ||= DefaultRepository.new(Appointment)
  end

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
  end
end
