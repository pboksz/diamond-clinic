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

  describe 'GET #request_appointment' do
    before { get :request_appointment }

    it { expect(assigns(:appointment)).to be_a_new Appointment }
    it { expect(assigns(:doctors)).to eq Doctor.all }
    it { expect(assigns(:clinical_trials)).to eq ClinicalTrial.all }
    it { expect(response).to render_template :request_appointment }
  end

  describe 'POST #appointment_create' do
    before { post :appointment_create, appointment: params }

    describe 'saves properly' do
      let(:mailer) { double }
      let(:doctor) { create(:doctor) }
      let(:params) { attributes_for(:appointment).merge(doctor: doctor) }
      before do
        expect(AppointmentMailer).to receive(:appointment_email) { mailer }
        expect(mailer).to receive(:deliver_now)
        post :appointment_create, appointment: params
      end

      it { expect(assigns(:appointment)).to be_persisted }
      it { expect(response).to redirect_to contact_us_path(locale) }
    end

    describe 'does not save' do
      let(:params) { attributes_for(:appointment, name: nil) }
      before { post :appointment_create, appointment: params }

      it { expect(assigns(:appointment)).not_to be_persisted }
      it { expect(assigns(:doctors)).to eq Doctor.all }
      it { expect(assigns(:clinical_trials)).to eq ClinicalTrial.all }
      it { expect(response).to render_template :request_appointment }
    end
  end
end
