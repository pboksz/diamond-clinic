require 'rails_helper'

describe Admin do
  let(:admin) { build(:admin) }

  describe 'validations' do
    it { expect(admin).to be_valid }

    describe 'format' do
      it { expect(build(:admin, email: nil)).not_to be_valid }
    end

    describe 'length' do
      it { expect(build(:admin, password: nil)).not_to be_valid }
      it { expect(build(:admin, password_confirmation: nil)).not_to be_valid }
    end

    describe 'passwords_must_match' do
      it { expect(build(:admin, password: '12345678', password_confirmation: '23456789')).not_to be_valid }
    end
  end

  describe 'before filters' do
    describe '#cleanup_passwords' do
      before { admin.save }

      it { expect(admin.password).to be_nil }
      it { expect(admin.password_confirmation).to be_nil }
    end
  end

  describe '#password=' do
    let(:admin) { Admin.new }
    let(:new_password) { 'new_password' }
    let(:encrypted_password) { 'encrypted_password' }
    before do
      expect(BCrypt::Password).to receive(:create).with(new_password, cost: 10).and_return(encrypted_password)
      admin.password = new_password
    end

    it { expect(admin.password).to eq new_password }
    it { expect(admin.encrypted_password).to eq encrypted_password }
  end

  describe '#password_confirmation=' do
    let(:admin) { Admin.new }
    let(:new_password) { 'new_password' }
    before { admin.password_confirmation = new_password }

    it { expect(admin.password_confirmation).to eq new_password }
  end

  describe '#valid_password?' do
    let(:encrypted_password) { admin.encrypted_password }
    let(:bcrypt) { double(salt: 'salt') }
    let(:password) { admin.password }
    before do
      expect(BCrypt::Password).to receive(:new).with(encrypted_password).and_return(bcrypt)
      expect(BCrypt::Engine).to receive(:hash_secret).with(password, bcrypt.salt).and_return(password)
      expect(Rack::Utils).to receive(:secure_compare).with(password, encrypted_password).and_return(true)
    end

    it { expect(admin.valid_password?(password)).to eq true }
  end
end
