require 'rails_helper'

describe AppointmentRequest do
  describe 'validations' do
    it { expect(build(:appointment_request)).to be_valid }

    describe 'presence' do
      it { expect(build(:appointment_request, :first_name => nil)).not_to be_valid }
      it { expect(build(:appointment_request, :last_name => nil)).not_to be_valid }
    end

    describe 'phone_number_is_plausible' do
      describe 'number is plausible' do
        let(:number) { '555555555' }
        it { expect(build(:appointment_request, :phone_number => number)).to be_valid }
      end

      describe 'number is not plausible' do
        let(:number) { 'invalid' }
        it { expect(build(:appointment_request, :phone_number => number)).not_to be_valid }
      end
    end
  end

  describe '#phone_number=' do
    let(:appointment_request) { build(:appointment_request, :phone_number => number) }
    subject { appointment_request[:phone_number] }

    describe 'is valid' do
      let(:number) { '555555555' }
      it { expect(subject).to eq Phony.normalize(number, :cc => '48') }
    end

    describe 'is invalid' do
      let(:number) { 'invalid' }
      it { expect(subject).to eq number }
    end
  end

  describe '#phone_number' do
    let(:appointment_request) { build(:appointment_request, :phone_number => number) }
    subject { appointment_request.phone_number }

    describe 'is valid' do
      let(:number) { '555555555' }
      it { expect(subject).to eq Phony.format("48#{number}", :format => :national)[1..-1] }
    end

    describe 'is invalid' do
      let(:number) { 'invalid' }
      it { expect(subject).to eq number }
    end
  end
end
