require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    before { get :index }
    it { expect(response).to render_template :index }
  end

  describe 'GET #about_us' do
    before { get :about_us }
    it { expect(response).to render_template :about_us }
  end

  describe 'GET #contact_us' do
    before { get :contact_us }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(assigns(:appointment)).to be_a_new Appointment }
    it { expect(response).to render_template :contact_us }
  end
end
