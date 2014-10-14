class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :specialty_pl, :type => String
  field :specialty_en, :type => String
  field :biography_pl, :type => String
  field :biography_en, :type => String

  validates :name, :specialty_pl, :specialty_en, :biography_pl, :biography_en, :presence => true

  def specialty(options = {})
    locale = options[:locale] || :pl
    self.send("specialty_#{locale}") if self.respond_to?("specialty_#{locale}")
  end

  def biography(options = {})
    locale = options[:locale] || :pl
    self.send("biography_#{locale}") if self.respond_to?("biography_#{locale}")
  end
end
