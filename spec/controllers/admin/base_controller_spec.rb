require 'rails_helper'

describe Admin::BaseController do
  describe '#authenticate_admin!' do
    subject { controller.authenticate_admin! }

    describe 'with current admin' do
      before do
        allow(controller).to receive(:current_admin).and_return(double)
        expect(controller).to receive(:redirect_to).with(admin_login_path(locale)).never
      end

      it { subject }
    end

    describe 'no current admin' do
      before do
        allow(controller).to receive(:current_admin).and_return(nil)
        expect(controller).to receive(:redirect_to).with(admin_login_path(locale))
      end

      it { subject }
    end
  end

  describe '#back_path' do
    describe 'has referer' do
      before { request.env['HTTP_REFERER'] = admin_doctors_path }
      it { expect(controller.back_path).to eq admin_doctors_path }
    end

    describe 'no referer' do
      let(:locale) { 'en' }
      before { allow(controller).to receive(:locale).and_return(locale) }

      describe 'default locale' do
        it { expect(controller.back_path).to eq admin_appointments_path(locale) }
      end

      describe 'passed locale' do
        let(:target_locale) { 'pl' }
        it { expect(controller.back_path(target_locale)).to eq admin_appointments_path(target_locale) }
      end
    end
  end

  describe '#create_admin_session' do
    let(:admin) { create(:admin) }
    before { controller.create_admin_session(admin) }

    it { expect(controller.instance_variable_get(:@current_admin)).to eq admin }
    it { expect(session[:admin_id]).to eq admin.id.to_s }
  end

  describe '#destroy_admin_session' do
    let(:admin) { create(:admin) }
    before do
      controller.create_admin_session(admin)
      controller.destroy_admin_session
    end

    it { expect(controller.instance_variable_get(:@current_admin)).to be_nil }
    it { expect(session[:admin_id]).to be_nil }
  end
end
