require 'rails_helper'

describe Doctor do
  let(:doctor) { build(:doctor) }

  describe 'validations' do
    it { expect(doctor).to be_valid }

    describe 'presence' do
      it { expect(build(:doctor, :first_name => nil)).not_to be_valid }
      it { expect(build(:doctor, :last_name => nil)).not_to be_valid }
      it { expect(build(:doctor, :specialty => nil)).not_to be_valid }
      it { expect(build(:doctor, :biography_en => nil)).not_to be_valid }
      it { expect(build(:doctor, :biography_pl => nil)).not_to be_valid }
    end
  end

  describe '#full_name' do
    it { expect(doctor.full_name).to eq "#{doctor.first_name} #{doctor.last_name}" }
  end

  describe '#full_title' do
    it { expect(doctor.full_title).to eq "#{doctor.title} #{doctor.full_name}" }
  end

  describe '#full_title_with_specialty' do
    it { expect(doctor.full_title_with_specialty).to eq "#{doctor.full_title} (#{doctor.specialty_name})" }
  end

  describe '#biography' do
    it { expect(doctor.biography).to eq doctor.biography_en }
    it { expect(doctor.biography(:pl)).to eq doctor.biography_pl }
    it { expect(doctor.biography(:invalid)).to be_nil }
  end

  describe '#specialty_name' do
    it { expect(doctor.specialty_name).to eq I18n.t("doctor.specialty.#{doctor.specialty}") }
  end
end
