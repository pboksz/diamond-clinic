require 'rails_helper'

describe Admin::ApplicationController do
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
end
