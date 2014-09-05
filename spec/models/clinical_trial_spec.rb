require 'rails_helper'

RSpec.describe ClinicalTrial, :type => :model do
  let(:clinical_trial) { build(:clinical_trial) }

  describe 'validations' do
    it { expect(clinical_trial).to be_valid }

    describe 'presence' do
      it { expect(build(:clinical_trial, :name => nil)).not_to be_valid }
      it { expect(build(:clinical_trial, :description_pl => nil)).not_to be_valid }
      it { expect(build(:clinical_trial, :description_en => nil)).not_to be_valid }
    end
  end

  describe '#description' do
    it { expect(clinical_trial.description).to eq clinical_trial.description_pl }
    it { expect(clinical_trial.description(:en)).to eq clinical_trial.description_en }
    it { expect(clinical_trial.description(:invalid)).to be_nil }
  end
end
