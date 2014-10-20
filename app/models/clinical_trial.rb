class ClinicalTrial
  include Mongoid::Document
  include Mongoid::Timestamps

  field :condition_pl, :type => String
  field :condition_en, :type => String
  field :description_pl, :type => String
  field :description_en, :type => String

  validates :condition_pl, :condition_en, :description_pl, :description_en, :presence => true

  def condition(options = {})
    locale = options[:locale] || :pl
    self.send("condition_#{locale}") if self.respond_to?("condition_#{locale}")
  end

  def description(options = {})
    locale = options[:locale] || :pl
    self.send("description_#{locale}") if self.respond_to?("description_#{locale}")
  end
end
