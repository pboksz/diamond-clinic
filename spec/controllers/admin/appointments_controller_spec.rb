require 'rails_helper'

describe Admin::AppointmentsController do
  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    before { get :index }

    it { expect(assigns(:appointments)).to eq Appointment.desc(:created_at) }
    it { expect(response).to render_template :index }
  end
end
