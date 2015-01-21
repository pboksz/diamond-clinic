class AdminsRepository < DefaultRepository
  def find_by_email(email)
    klass.where(email: email).first
  end
end
