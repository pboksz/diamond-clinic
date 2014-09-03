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
      let(:params) { attributes_for(:doctor, :first_name => nil) }

      it { expect(assigns(:doctor)).not_to be_persisted }
      it { expect(response).to render_template :new }
    end
  end
end
