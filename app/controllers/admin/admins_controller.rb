class Admin::AdminsController < Admin::ApplicationController
  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(create_params)

    if @admin.save
      redirect_to admin_admins_path(locale)
    else
      render :new
    end
  end

  def destroy
    @admin = Admin.find(params[:id]).destroy
    redirect_to admin_admins_path(locale)
  end

  private

  def create_params
    params.require(:admin).permit(:email, :password, :password_confirmation)
  end
end
