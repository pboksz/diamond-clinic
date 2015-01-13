class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin!

  helper_method :back_path
  def back_path(target_locale = locale)
    request.env['HTTP_REFERER'] || admin_appointments_path(target_locale)
  end
end
