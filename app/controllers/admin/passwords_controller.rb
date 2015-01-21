class Admin::PasswordsController < Admin::BaseController
  def edit

  end

  def update
    if current_admin_repository.update(update_params)
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
