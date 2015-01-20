class PasswordEncryptor
  def encrypt_password(password)
    BCrypt::Password.create(password, cost: 10)
  end

  def compare_password?(password, encrypted_password)
    salt = encrypted_salt(encrypted_password)
    hashed = encrypted_password(password, salt)
    Rack::Utils.secure_compare(hashed, encrypted_password)
  end

  private

  def encrypted_salt(encrypted_password)
    BCrypt::Password.new(encrypted_password).salt
  end

  def encrypted_password(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
  end
end
