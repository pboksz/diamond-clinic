require 'rails_helper'

describe Admin::AdminsController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }

    it { expect(assigns(:admins)).to eq Admin.all }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:admin)).to be_a_new Admin }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    before { post :create, admin: params }

    describe 'saves properly' do
      let(:params) { attributes_for(:admin) }

      it { expect(assigns(:admin)).to be_persisted }
      it { expect(response).to redirect_to admin_admins_path(locale) }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:admin, email: nil) }

      it { expect(assigns(:admin)).not_to be_persisted }
      it { expect(response).to render_template :new }
    end
  end

  describe 'DELETE #destroy' do
    let!(:admin) { create(:admin) }
    subject { delete :destroy, id: admin.id }

    it { expect { subject }.to change { Admin.count }.by(-1) }
    it { subject; expect(response).to redirect_to admin_admins_path(locale) }
  end
end
