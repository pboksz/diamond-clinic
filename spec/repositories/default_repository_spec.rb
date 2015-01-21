require 'rails_helper'

describe DefaultRepository do
  let(:new_name) { 'New name' }
  let(:repository) { DefaultRepository.new(Doctor) }

  describe '#all' do
    let!(:doctor) { create(:doctor) }
    it { expect(repository.all).to eq Doctor.all }
  end

  describe '#new' do
    describe 'no attributes' do
      it { expect(repository.new).to be_a Doctor }
    end

    describe 'with attributes' do
      it { expect(repository.new(name_en: new_name).name_en).to eq new_name }
    end
  end

  describe '#find' do
    describe 'exists in db' do
      let!(:doctor) { create(:doctor) }
      it { expect(repository.find(doctor.id)).to eq doctor }
    end

    describe 'does not exist in db' do
      it { expect(repository.find(1234)).to be_nil }
    end
  end

  describe '#create' do
    describe 'valid attributes' do
      it { expect{ repository.create(attributes_for(:doctor)) }.to change{ Doctor.count }.by(1) }
    end

    describe 'invalid attributes' do
      it { expect{ repository.create(name_en: nil) }.to change{ Doctor.count }.by(0) }
    end
  end

  describe '#update' do
    let!(:doctor) { create(:doctor) }
    before { repository.update(doctor.id, name_en: new_name) }

    it { expect(doctor.reload.name_en).to eq new_name }
  end

  describe '#destroy' do
    let!(:doctor) { create(:doctor) }
    it { expect{ repository.destroy(doctor.id) }.to change{ Doctor.count }.by(-1) }
  end
end
