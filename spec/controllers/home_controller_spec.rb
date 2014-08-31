require 'rails_helper'

describe HomeController do
  describe 'GET #about_us' do
    before { get :about_us }
    it { expect(response).to render_template :about_us }
  end

  describe 'GET #our_doctors' do
    before { get :our_doctors }
    it { expect(response).to render_template :our_doctors }
  end

  describe 'GET #services' do
    before { get :services }
    it { expect(response).to render_template :services }
  end

  describe 'GET #clinical_research' do
    before { get :clinical_research }
    it { expect(response).to render_template :clinical_research }
  end

  describe 'GET #contact_us' do
    before { get :contact_us }

    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(assigns(:appointment)).to be_a_new Appointment }
    it { expect(response).to render_template :contact_us }
  end

  describe 'POST #appointment_create' do
    before { post :appointment_create, :appointment => params }

    describe 'saves properly' do
      let(:mailer) { double }
      let(:params) { attributes_for(:appointment) }
      before do
        expect(AppointmentMailer).to receive(:appointment_email) { mailer }
        expect(mailer).to receive(:deliver)
        post :appointment_create, :appointment => params
      end

      it { expect(assigns(:appointment)).to be_persisted }
      it { expect(response).to redirect_to contact_us_path }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:appointment, :first_name => nil) }
      before { post :appointment_create, :appointment => params }

      it { expect(assigns(:appointment)).not_to be_persisted }
      it { expect(assigns(:doctors)).to eq Doctor.all }
      it { expect(response).to render_template :contact_us }
    end
  end
end
