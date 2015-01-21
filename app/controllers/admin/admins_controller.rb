class Admin::AdminsController < Admin::ApplicationController
  def index
    @admins = admins_repository.all
  end

  def new
    @admin = admins_repository.new
  end

  def create
    @admin = admins_repository.create(create_params)

    if @admin.persisted?
      redirect_to admin_admins_path(locale)
    else
      render :new
    end
  end

  def destroy
    admins_repository.destroy(params[:id])
    redirect_to admin_admins_path(locale)
  end

  private

  def create_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
