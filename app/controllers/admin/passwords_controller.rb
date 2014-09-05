class Admin::PasswordsController < Admin::ApplicationController
  def edit
    @admin = current_admin
  end

  def update
    if current_admin.update_attributes(update_params)
      sign_in current_admin, :bypass => true
      redirect_to admin_root_path(locale)
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
