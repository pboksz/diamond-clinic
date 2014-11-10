class Doctor
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :photo, PhotoUploader

  field :order, :type => Integer
  field :name_pl, :type => String
  field :name_en, :type => String
  field :specialty_pl, :type => String
  field :specialty_en, :type => String
  field :biography_pl, :type => String
  field :biography_en, :type => String

  default_scope -> { order_by(:order.asc) }

  validates :order, :numericality => { :only_integer => true }
  validates :name_pl, :name_en, :specialty_pl, :specialty_en, :biography_pl, :biography_en, :presence => true

  def name(options = {})
    locale = options[:locale] || :pl
    self.send("name_#{locale}") if self.respond_to?("name_#{locale}")
  end

  def specialty(options = {})
    locale = options[:locale] || :pl
    self.send("specialty_#{locale}") if self.respond_to?("specialty_#{locale}")
  end

  def biography(options = {})
    locale = options[:locale] || :pl
    self.send("biography_#{locale}") if self.respond_to?("biography_#{locale}")
  end
end
