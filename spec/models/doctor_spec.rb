require 'rails_helper'

describe Doctor do
  let(:doctor) { build(:doctor) }

  describe 'validations' do
    it { expect(doctor).to be_valid }

    describe 'presence' do
      it { expect(build(:doctor, :name_pl => nil)).not_to be_valid }
      it { expect(build(:doctor, :name_en => nil)).not_to be_valid }
      it { expect(build(:doctor, :specialty_pl => nil)).not_to be_valid }
      it { expect(build(:doctor, :specialty_en => nil)).not_to be_valid }
      it { expect(build(:doctor, :biography_en => nil)).not_to be_valid }
      it { expect(build(:doctor, :biography_pl => nil)).not_to be_valid }
    end
  end

  describe '#name' do
    it { expect(doctor.name).to eq doctor.name_pl }
    it { expect(doctor.name(:locale => :en)).to eq doctor.name_en }
    it { expect(doctor.name(:locale => :invalid)).to be_nil }
  end

  describe '#specialty' do
    it { expect(doctor.specialty).to eq doctor.specialty_pl }
    it { expect(doctor.specialty(:locale => :en)).to eq doctor.specialty_en }
    it { expect(doctor.specialty(:locale => :invalid)).to be_nil }
  end

  describe '#biography' do
    it { expect(doctor.biography).to eq doctor.biography_pl }
    it { expect(doctor.biography(:locale => :en)).to eq doctor.biography_en }
    it { expect(doctor.biography(:locale => :invalid)).to be_nil }
  end
end
