class Doctor
  # include Mongoid::Document
  # include Mongoid::Timestamps
  #
  # mount_uploader :photo, PhotoUploader
  #
  # field :order, type: Integer
  # field :name_pl, type: String
  # field :name_en, type: String
  # field :specialty_pl, type: String
  # field :specialty_en, type: String
  # field :biography_pl, type: String
  # field :biography_en, type: String

  default_scope -> { order_by(:order.asc) }

  validates :order, numericality: { only_integer: true }
  validates :name_pl, :name_en, :specialty_pl, :specialty_en, :biography_pl, :biography_en, presence: true

  translation_accessor :name, :specialty, :biography
end
