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
end
