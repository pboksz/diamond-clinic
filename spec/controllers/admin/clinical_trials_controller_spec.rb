require 'rails_helper'

describe Admin::ClinicalTrialsController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }

    it { expect(assigns(:clinical_trials)).to eq ClinicalTrial.all }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:clinical_trial)).to be_a_new ClinicalTrial }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    before { post :create, clinical_trial: params }

    describe 'saves properly' do
      let(:params) { attributes_for(:clinical_trial) }

      it { expect(assigns(:clinical_trial)).to be_persisted }
      it { expect(response).to redirect_to admin_clinical_trials_path(locale) }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:clinical_trial, condition_pl: nil) }

      it { expect(assigns(:clinical_trial)).not_to be_persisted }
      it { expect(response).to render_template :new }
    end
  end

  describe 'GET #edit' do
    let(:clinical_trial) { create(:clinical_trial) }
    before { get :edit, id: clinical_trial.id }

    it { expect(assigns(:clinical_trial)).to eq clinical_trial }
    it { expect(response).to render_template :edit }
  end

  describe 'PUT #update' do
    let(:clinical_trial) { create(:clinical_trial) }
    before { put :update, id: clinical_trial.id, clinical_trial: params }

    describe 'valid params' do
      let(:params) { { condition_pl: 'New Condition' } }

      it { expect(clinical_trial.reload.condition).to eq 'New Condition' }
      it { expect(response).to redirect_to admin_clinical_trials_path(locale) }
    end

    describe 'invalid params' do
      let(:params) { { condition_pl: nil } }
      it { expect(response).to render_template :edit }
    end
  end

  describe 'DELETE #destroy' do
    let!(:clinical_trial) { create(:clinical_trial) }
    subject { delete :destroy, id: clinical_trial.id }

    it { expect { subject }.to change { ClinicalTrial.count }.by(-1) }
    it { subject; expect(response).to redirect_to admin_clinical_trials_path(locale) }
  end
end
