class Admin
  include Mongoid::Document
  include Mongoid::Timestamps

  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  attr_reader :password, :password_confirmation

  validates :email, format: { with: Regexp.new(A9n.email_regex) }
  validates :password, :password_confirmation, length: { minimum: 8 }
  validate :passwords_must_match

  before_save :cleanup_passwords

  def password_encryptor
    @password_encryptor ||= PasswordEncryptor.new
  end

  def password=(new_password)
    @password = new_password
    self.encrypted_password = password_encryptor.encrypt_password(new_password)
  end

  def password_confirmation=(new_password)
    @password_confirmation = new_password
  end

  def valid_password?(password)
    password_encryptor.compare_password?(password, encrypted_password)
  end

  private

  def cleanup_passwords
    @password = @password_confirmation = nil
  end

  def passwords_must_match
    unless @password == @password_confirmation
      errors[:password] << ''
      errors[:password_confirmation] << ''
    end
  end
end
