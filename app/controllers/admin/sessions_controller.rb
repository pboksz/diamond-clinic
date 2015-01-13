class Admin::SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(resource)
    admin_appointments_path(locale)
  end
end
