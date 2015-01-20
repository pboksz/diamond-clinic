module LoginHelpers
  def sign_in(admin)
    session[:admin_id] = admin.id
  end

  def locale
    controller.locale
  end
end
