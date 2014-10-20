require 'rails_helper'

RSpec.describe ClinicalTrial, :type => :model do
  let(:clinical_trial) { build(:clinical_trial) }

  describe 'validations' do
    it { expect(clinical_trial).to be_valid }

    describe 'numericality' do
      it { expect(build(:clinical_trial, :order => nil)).not_to be_valid }
    end

    describe 'presence' do
      it { expect(build(:clinical_trial, :condition_pl => nil)).not_to be_valid }
      it { expect(build(:clinical_trial, :condition_en => nil)).not_to be_valid }
      it { expect(build(:clinical_trial, :description_pl => nil)).not_to be_valid }
      it { expect(build(:clinical_trial, :description_en => nil)).not_to be_valid }
    end
  end

  describe '#condition' do
    it { expect(clinical_trial.condition).to eq clinical_trial.condition_pl }
    it { expect(clinical_trial.condition(:locale => :en)).to eq clinical_trial.condition_en }
    it { expect(clinical_trial.condition(:locale => :invalid)).to be_nil }
  end

  describe '#description' do
    it { expect(clinical_trial.description).to eq clinical_trial.description_pl }
    it { expect(clinical_trial.description(:locale => :en)).to eq clinical_trial.description_en }
    it { expect(clinical_trial.description(:locale => :invalid)).to be_nil }
  end
end
