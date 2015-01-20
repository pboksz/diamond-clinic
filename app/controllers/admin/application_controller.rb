class Admin::ApplicationController < ApplicationController
  before_action :authenticate_admin!
  def authenticate_admin!
    redirect_to admin_login_path(locale) unless current_admin
  end
end
