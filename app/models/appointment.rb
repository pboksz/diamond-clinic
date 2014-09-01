class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :doctor_id, :type => Integer
  field :first_name, :type => String
  field :last_name, :type => String
  field :email, :type => String
  field :phone_number, :type => String
  field :date, :type => Date
  field :time, :type => String
  field :message, :type => String

  belongs_to :doctor

  validates :doctor, :first_name, :last_name, :date, :time, :presence => true
  validates :email, :format => { :with => Devise.email_regexp }
  validate  :phone_number_is_plausible

  def phone_number=(value)
    self[:phone_number] = normalize_phone_number(value)
  end

  def phone_number
    format_phone_number(self[:phone_number])
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def available_times
    @available_times ||= generate_available_times
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

  def generate_available_times
    (9..20).flat_map do |hour|
      ['00', '15', '30', '45'].map do |minute|
        "#{hour.to_s.rjust(2, '0')}:#{minute}"
      end
    end
  end
end
