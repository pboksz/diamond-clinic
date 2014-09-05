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
    before { post :create, :clinical_trial => params }

    describe 'saves properly' do
      let(:params) { attributes_for(:clinical_trial) }

      it { expect(assigns(:clinical_trial)).to be_persisted }
      it { expect(response).to redirect_to admin_clinical_trials_path }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:clinical_trial, :condition => nil) }

      it { expect(assigns(:clinical_trial)).not_to be_persisted }
      it { expect(response).to render_template :new }
    end
  end

  describe 'DELETE #destroy' do
    let!(:clinical_trial) { create(:clinical_trial) }
    subject { delete :destroy, :id => clinical_trial.id }

    it { expect { subject }.to change { ClinicalTrial.count }.by(-1) }
    it { subject; expect(response).to redirect_to admin_clinical_trials_path }
  end
end
