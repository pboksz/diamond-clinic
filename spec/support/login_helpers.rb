module LoginHelpers
  def sign_in(admin)
    session[:admin_id] = admin.id
  end
end
