class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate_admin!

  def new
    if current_admin
      redirect_to admin_appointments_path(locale)
    else
      @admin = admins_repository.new
      render :new
    end
  end

  def create
    admin = admins_repository.find_by_email(create_params[:email])

    if admin && admin.valid_password?(create_params[:password])
      admins_repository.update_login_information(admin.id)
      create_admin_session(admin)

      redirect_to admin_appointments_path(locale)
    else
      @admin = admins_repository.new
      render :new
    end
  end

  def destroy
    destroy_admin_session
    redirect_to root_path(locale)
  end

  private

  def create_params
    params.require(:admin).permit(:email, :password)
  end
end
