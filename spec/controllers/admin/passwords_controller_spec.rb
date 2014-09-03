require 'rails_helper'

describe Admin::PasswordsController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #edit' do
    before { get :edit }
    it { expect(response).to render_template :edit }
  end

  describe 'PUT #update' do
    before { put :update, :admin => params }

    describe 'valid params' do
      let(:params) { { :password => 'password', :password_confirmation => 'password' } }
      it { expect(response).to redirect_to admin_root_path }
    end

    describe 'invalid params' do
      let(:params) { { :password => '' } }
      it { expect(response).to render_template :edit }
    end
  end
end
