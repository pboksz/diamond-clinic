require 'rails_helper'

describe Admin::SessionsController do
  describe 'GET #new' do
    describe 'with current admin' do
      before do
        allow(controller).to receive(:current_admin).and_return(double)
        get :new
      end

      it { expect(response).to redirect_to admin_appointments_path }
    end

    describe 'no current admin' do
      before { get :new }

      it { expect(assigns(:admin)).to be_a_new Admin }
      it { expect(response).to render_template :new }
    end
  end

  describe 'POST #create' do
    describe 'admin not in db' do
      let(:admin) { nil }
      before { post :create, admin: { email: nil } }

      it { expect(assigns(:admin)).to be_a_new Admin }
      it { expect(response).to render_template :new }
    end

    describe 'admin exists in db' do
      let(:password) { 'password' }
      let(:admin) { create(:admin, password: password) }
      before do
        allow(admin).to receive(:valid_password?).with(admin.password).and_return(true)
        expect(controller).to receive(:create_admin_session).with(admin)
        post :create, admin: { email: admin.email, password: password }
      end

      it { expect(response).to redirect_to admin_appointments_path }
    end
  end

  describe 'GET #destroy' do
    before do
      expect(controller).to receive(:destroy_admin_session)
      get :destroy
    end

    it { expect(response).to redirect_to root_path }
  end
end
