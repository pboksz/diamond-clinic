class Doctor < ActiveRecord::Base
  default_scope -> { order_by(:order.asc) }

  validates :order, numericality: { only_integer: true }
  validates :name_pl, :name_en, :specialty_pl, :specialty_en, :biography_pl, :biography_en, presence: true

  translation_accessor :name, :specialty, :biography
end
