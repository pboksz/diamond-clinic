require 'rails_helper'

describe ApplicationController do
  controller do
    def index
      render :nothing => true
    end
  end

  describe 'before filter' do
    describe '#set_locale' do
      before { get :index, params }
      subject { I18n.locale }

      describe 'params has locale' do
        let(:params) { { :locale => :pl } }
        it { expect(subject).to eq :pl }
      end

      describe 'params does not have locale' do
        let(:params) { {} }
        it { expect(subject).to eq I18n.default_locale }
      end
    end
  end

  describe '#locale' do
    before { get :index, params }
    subject { controller.locale }

    describe 'params has locale' do
      let(:params) { { :locale => :pl } }
      it { expect(subject).to eq 'pl' }
    end

    describe 'params does not have locale' do
      let(:params) { {} }
      it { expect(subject).to be_nil }
    end
  end
end
