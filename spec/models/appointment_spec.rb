require 'rails_helper'

describe Appointment do
  let(:appointment) { build(:appointment) }

  describe 'validations' do
    it { expect(appointment).to be_valid }

    describe 'presence' do
      it { expect(build(:appointment, name: nil)).not_to be_valid }
    end

    describe 'format' do
      it { expect(build(:appointment, email: nil)).not_to be_valid }
    end

    describe 'phone_number_is_plausible' do
      describe 'number is plausible' do
        let(:number) { '555555555' }
        it { expect(build(:appointment, phone_number: number)).to be_valid }
      end

      describe 'number is not plausible' do
        let(:number) { 'invalid' }
        it { expect(build(:appointment, phone_number: number)).not_to be_valid }
      end
    end
  end

  describe '#phone_number=' do
    let(:appointment) { build(:appointment, phone_number: number) }
    subject { appointment[:phone_number] }

    describe 'is valid' do
      let(:number) { '555555555' }
      it { expect(subject).to eq Phony.normalize(number, cc: '48') }
    end

    describe 'is invalid' do
      let(:number) { 'invalid' }
      it { expect(subject).to eq number }
    end
  end

  describe '#phone_number' do
    let(:appointment) { build(:appointment, phone_number: number) }
    subject { appointment.phone_number }

    describe 'is valid' do
      let(:number) { '555555555' }
      it { expect(subject).to eq Phony.format("48#{number}", format: :national)[1..-1] }
    end

    describe 'is invalid' do
      let(:number) { 'invalid' }
      it { expect(subject).to eq number }
    end
  end

  describe '#when' do
    it { expect(appointment.when).to eq "#{appointment.date} @ #{appointment.time}" }
  end

  describe '#available_times' do
    it { expect(appointment.available_times).to include '09:00', '20:45' }
  end
end
