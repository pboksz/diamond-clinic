class AdminController < ApplicationController
  before_filter :authenticate_admin!

  def index

  end

  def appointments

  end

  def doctors

  end

  def admins

  end
end
