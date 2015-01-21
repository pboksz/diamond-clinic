class CurrentAdminRepository
  attr_reader :current_admin

  def initialize(current_admin)
    @current_admin = current_admin
  end

  def update(attributes)
    current_admin.update_attributes(attributes)
  end
end
