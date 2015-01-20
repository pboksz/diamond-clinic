class Admin::PasswordsController < Admin::ApplicationController
  def edit

  end

  def update
    if current_admin.update_attributes(update_params)
      sign_in current_admin, bypass: true
      redirect_to back_path(locale)
    else
      render :edit
    end
  end

  private

  helper_method :back_path
  def back_path(target_locale = locale)
    request.env['HTTP_REFERER'] || admin_appointments_path(target_locale)
  end

  def update_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
