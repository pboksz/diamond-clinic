require 'rails_helper'

describe Doctor do
  describe 'validations' do
    it { expect(build(:doctor)).to be_valid }

    describe 'presence' do
      it { expect(build(:doctor, :first_name => nil)).not_to be_valid }
      it { expect(build(:doctor, :last_name => nil)).not_to be_valid }
      it { expect(build(:doctor, :specialty => nil)).not_to be_valid }
      it { expect(build(:doctor, :biography => nil)).not_to be_valid }
    end
  end

  describe '#full_name' do
    let(:doctor) { build(:doctor) }
    it { expect(doctor.full_name).to eq "#{doctor.first_name} #{doctor.last_name}" }
  end
end
