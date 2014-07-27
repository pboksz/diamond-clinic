class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name, :type => String
  field :biography, :type => String

  validates :first_name, :last_name, :biography, :presence => true
end
