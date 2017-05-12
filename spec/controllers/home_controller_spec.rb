require 'rails_helper'

describe HomeController do
  describe 'GET #about_us' do
    before { get :about_us }
    it { expect(response).to render_template :about_us }
  end

  describe 'GET #our_doctors' do
    before { get :our_doctors }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(response).to render_template :our_doctors }
  end

  describe 'GET #our_services' do
    before { get :our_services }
    it { expect(response).to render_template :our_services }
  end

  describe 'GET #clinical_research' do
    before { get :clinical_research }

    it { expect(assigns(:clinical_trials)).to eq ClinicalTrial.all }
    it { expect(response).to render_template :clinical_research }
  end

  describe 'GET #contact_us' do
    before { get :contact_us }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(response).to render_template :contact_us }
  end

  describe 'GET #sitemap' do
    before { get :sitemap, format: 'xml' }
    it { expect(response).to render_template :sitemap, layout: false }
  end
end
