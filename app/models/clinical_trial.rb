class ClinicalTrial
  include Mongoid::Document
  include Mongoid::Timestamps

  field :condition, :type => String
  field :description_pl, :type => String
  field :description_en, :type => String

  validates :condition, :description_pl, :description_en, :presence => true

  def description(locale = :pl)
    self.send("description_#{locale}") if self.respond_to?("description_#{locale}")
  end
end
