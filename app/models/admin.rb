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

  def password=(new_password)
    @password = new_password
    self.encrypted_password = BCrypt::Password.create(new_password, cost: 10)
  end

  def password_confirmation=(new_password)
    @password_confirmation = new_password
  end

  def valid_password?(password)
    bcrypt = BCrypt::Password.new(encrypted_password)
    password = BCrypt::Engine.hash_secret(password, bcrypt.salt)
    ::Rack::Utils.secure_compare(password, encrypted_password)
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
