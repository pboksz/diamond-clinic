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
    it { expect(response).to render_template :appointments }
  end

  describe 'GET #doctors' do
    before { get :doctors }
    it { expect(response).to render_template :doctors }
  end

  describe 'GET #admins' do
    before { get :admins }
    it { expect(response).to render_template :admins }
  end
end
