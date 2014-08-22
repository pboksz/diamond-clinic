require 'rails_helper'

describe AdminController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }
    it { expect(response).to render_template :index }
  end

  describe 'GET #appointments' do
    before { get :appointments }

    it { expect(assigns(:appointments)).to eq Appointment.all }
    it { expect(response).to render_template :appointments }
  end

  describe 'GET #doctors' do
    before { get :doctors }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(response).to render_template :doctors }
  end

  describe 'GET #doctors_new' do
    before { get :doctors_new }

    it { expect(assigns(:doctor)).to be_a_new Doctor }
    it { expect(response).to render_template :doctors_new }
  end

  describe 'POST #doctors_create' do
    before { post :doctors_create, :doctor => params }

    describe 'saves properly' do
      let(:params) { attributes_for(:doctor) }

      it { expect(assigns(:doctor)).to be_persisted }
      it { expect(response).to redirect_to admin_doctors_path }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:doctor, :first_name => nil) }

      it { expect(assigns(:doctor)).not_to be_persisted }
      it { expect(response).to render_template :doctors_new }
    end
  end

  describe 'GET #admins' do
    before { get :admins }

    it { expect(assigns(:admins)).to eq Admin.all }
    it { expect(response).to render_template :admins }
  end

  describe 'GET #admins_new' do
    before { get :admins_new }

    it { expect(assigns(:admin)).to be_a_new Admin }
    it { expect(response).to render_template :admins_new }
  end

  describe 'POST #admins_create' do
    before { post :admins_create, :admin => params }

    describe 'saves properly' do
      let(:params) { attributes_for(:admin) }

      it { expect(assigns(:admin)).to be_persisted }
      it { expect(response).to redirect_to admin_admins_path }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:admin, :email => nil) }

      it { expect(assigns(:admin)).not_to be_persisted }
      it { expect(response).to render_template :admins_new }
    end
  end
end
