class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, :type => String
  field :last_name, :type => String
  field :phone_number, :type => String

  validates :first_name, :last_name, :presence => true
  validate  :phone_number_is_plausible

  def phone_number=(value)
    self[:phone_number] = normalize_phone_number(value)
  end

  def phone_number
    format_phone_number(self[:phone_number])
  end

  private

  def phone_number_plausible?(value)
    Phony.plausible?(value, :cc => '48')
  end

  def phone_number_is_plausible
    unless phone_number_plausible?(self[:phone_number])
      errors[:phone_number] << 'is invalid'
    end
  end

  def normalize_phone_number(value)
    if phone_number_plausible?("+48#{value}")
      Phony.normalize(value, :cc => '48')
    else
      value
    end
  end

  def format_phone_number(value)
    if phone_number_plausible?(value)
      Phony.format(value, :format => :national)[1..-1]
    else
      value
    end
  end
end