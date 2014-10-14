require 'rails_helper'

describe Admin::DoctorsController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(response).to render_template :index }
  end

  describe 'GET #new' do
    before { get :new }

    it { expect(assigns(:doctor)).to be_a_new Doctor }
    it { expect(response).to render_template :new }
  end

  describe 'POST #create' do
    before { post :create, :doctor => params }

    describe 'saves properly' do
      let(:params) { attributes_for(:doctor) }

      it { expect(assigns(:doctor)).to be_persisted }
      it { expect(response).to redirect_to admin_doctors_path }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:doctor, :name => nil) }

      it { expect(assigns(:doctor)).not_to be_persisted }
      it { expect(response).to render_template :new }
    end
  end

  describe 'GET #edit' do
    let(:doctor) { create(:doctor) }
    before { get :edit, :id => doctor.id }

    it { expect(assigns(:doctor)).to eq doctor }
    it { expect(response).to render_template :edit }
  end

  describe 'PUT #update' do
    let(:doctor) { create(:doctor) }
    before { put :update, :id => doctor.id, :doctor => params }

    describe 'valid params' do
      let(:params) { { :name => 'Dr. Who' } }

      it { expect(doctor.reload.name).to eq 'Dr. Who' }
      it { expect(response).to redirect_to admin_doctors_path }
    end

    describe 'invalid params' do
      let(:params) { { :name => nil } }
      it { expect(response).to render_template :edit }
    end
  end
end
