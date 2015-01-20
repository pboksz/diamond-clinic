class Appointment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :doctor_id, type: BSON::ObjectId
  field :clinical_trial_id, type: BSON::ObjectId
  field :name, type: String
  field :email, type: String
  field :phone_number, type: String
  field :date, type: Date
  field :time, type: String
  field :message, type: String

  default_scope -> { order_by(:created_at.desc) }

  belongs_to :doctor
  delegate :name, to: :doctor, prefix: true, allow_nil: true

  belongs_to :clinical_trial
  delegate :condition, to: :clinical_trial, prefix: true, allow_nil: true

  validates :name, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validate  :phone_number_is_plausible

  def phone_number=(value)
    self[:phone_number] = normalize_phone_number(value)
  end

  def phone_number
    format_phone_number(self[:phone_number])
  end

  def when
    "#{date} @ #{time}"
  end

  def available_times
    @available_times ||= generate_available_times
  end

  private

  def phone_number_plausible?(value)
    Phony.plausible?(value, cc: '48')
  end

  def phone_number_is_plausible
    unless phone_number_plausible?(self[:phone_number])
      errors[:phone_number] << 'is invalid'
    end
  end

  def normalize_phone_number(value)
    if phone_number_plausible?("+48#{value}")
      Phony.normalize(value, cc: '48')
    else
      value
    end
  end

  def format_phone_number(value)
    if phone_number_plausible?(value)
      Phony.format(value, format: :national)[1..-1]
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
