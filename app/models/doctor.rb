class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, :type => String
  field :first_name, :type => String
  field :last_name, :type => String
  field :specialty, :type => String
  field :biography_en, :type => String
  field :biography_pl, :type => String

  validates :title, :first_name, :last_name, :specialty, :biography_en, :biography_pl, :presence => true

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_title
    "#{title} #{full_name}"
  end

  def full_title_with_specialty
    "#{full_title} (#{specialty_name})"
  end

  def biography(locale = :en)
    self.send("biography_#{locale}") if self.respond_to?("biography_#{locale}")
  end

  def specialty_name
    I18n.t("doctor.specialty.#{self[:specialty]}")
  end
end
