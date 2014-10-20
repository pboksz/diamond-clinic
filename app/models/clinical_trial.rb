class ClinicalTrial
  include Mongoid::Document
  include Mongoid::Timestamps

  field :order, :type => Integer
  field :condition_pl, :type => String
  field :condition_en, :type => String
  field :description_pl, :type => String
  field :description_en, :type => String

  default_scope -> { order_by(:order.asc) }

  validates :order, :numericality => { :only_integer => true }
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
