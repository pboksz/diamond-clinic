class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name, :type => String
  field :specialty, :type => String
  field :biography, :type => String

  validates :first_name, :last_name, :specialty, :biography, :presence => true

  def full_name
    "#{first_name} #{last_name}"
  end
end
