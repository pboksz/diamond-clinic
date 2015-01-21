require 'rails_helper'

describe AdminsRepository do
  let(:repository) { AdminsRepository.new(Admin) }

  describe '#find_by_email' do
    describe 'exists in db' do
      let!(:admin) { create(:admin) }
      it { expect(repository.find_by_email(admin.email)).to eq admin }
    end

    describe 'does not exist in db' do
      it { expect(repository.find_by_email(1234)).to be_nil }
    end
  end

  describe '#update_login_information' do
    let(:time) { Time.new('2000-01-01') }
    let!(:admin) { create(:admin, last_sign_in_at: time - 2.weeks) }
    before do
      allow(Time).to receive(:now).and_return(time)
      repository.update_login_information(admin.id)
    end

    it { expect(admin.reload.last_sign_in_at).to eq time }
    it { expect(admin.reload.sign_in_count).to eq 1 }
  end
end
