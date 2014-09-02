class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name, :type => String
  field :specialty, :type => String
  field :biography_en, :type => String
  field :biography_pl, :type => String

  validates :first_name, :last_name, :specialty, :biography_en, :biography_pl, :presence => true

  def full_name
    "#{first_name} #{last_name}"
  end

  def biography(locale = :en)
    self.send("biography_#{locale}") if self.respond_to?("biography_#{locale}")
  end
end
