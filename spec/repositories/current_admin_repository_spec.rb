require 'rails_helper'

describe CurrentAdminRepository do
  let(:current_admin) { create(:admin) }
  let(:repository) { CurrentAdminRepository.new(current_admin) }

  describe '#update' do
    subject { repository.update(password: 'new_password', password_confirmation: 'new_password') }
    it { expect{ subject }.to change{ Admin.find(current_admin.id).encrypted_password } }
  end
end
