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
end
