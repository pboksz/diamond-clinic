class Admin::PasswordsController < Admin::ApplicationController
  def edit

  end

  def update
    if current_admin.update_attributes(update_params)
      redirect_to back_path(locale)
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:admin).permit(:password, :password_confirmation)
  end
end
