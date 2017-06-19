class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale

  def after_login_path(new_locale = locale)
    admin_doctors_path(locale)
  end

  def after_logout_path(new_locale = locale)
    root_path(locale)
  end

  def clinic_trials_repository
    @clinical_trials_repository ||= DefaultRepository.new(ClinicalTrial)
  end

  def doctors_repository
    @doctors_repository ||= DefaultRepository.new(Doctor)
  end

  private

  def set_locale
    I18n.locale = locale || I18n.default_locale
  end
end
