require 'rails_helper'

describe DoctorsController do
  describe 'GET #photo' do
    describe 'without photo' do
      let(:doctor) { create(:doctor) }
      before do
        expect(controller).to receive(:send_data).never
        get :photo, :id => doctor.id
      end

      it { expect(assigns(:doctor)).to eq doctor }
    end

    describe 'with photo' do
      let(:doctor) { create(:doctor_with_photo) }
      before do
        expect(controller).to receive(:send_data).with(doctor.photo.read, :type => doctor.photo.file.content_type, :disposition => 'inline')
        expect(controller).to receive(:render).and_return(true)
        get :photo, :id => doctor.id
      end

      it { expect(assigns(:doctor)).to eq doctor }
    end
  end
end
