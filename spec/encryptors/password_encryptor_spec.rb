require 'rails_helper'

describe PasswordEncryptor do
  let(:encryptor) { PasswordEncryptor.new }
  let(:password) { 'password' }

  describe '#encrypt_password' do
    before { expect(BCrypt::Password).to receive(:create).with(password, cost: 10) }
    it { encryptor.encrypt_password(password) }
  end

  describe '#compare_password?' do
    let(:encrypted_password) { 'encrypted_password' }
    let(:salt) { 'salt' }
    let(:encrypt) { double(salt: salt) }
    before do
      expect(BCrypt::Password).to receive(:new).with(encrypted_password).and_return(encrypt)
      expect(BCrypt::Engine).to receive(:hash_secret).with(password, salt).and_return(password)
      expect(Rack::Utils).to receive(:secure_compare).with(password, encrypted_password).and_return(true)
    end

    it { expect(encryptor.compare_password?(password, encrypted_password)).to eq true }
  end
end
