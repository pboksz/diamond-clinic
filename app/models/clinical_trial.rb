class ClinicalTrial < ActiveRecord::Base
  default_scope -> { order_by(:order.asc) }

  validates :order, numericality: { only_integer: true }
  validates :condition_pl, :condition_en, :description_pl, :description_en, presence: true

  translation_accessor :condition, :description
end
