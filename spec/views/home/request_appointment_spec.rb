require 'rails_helper'

describe '/home/request_appointment.haml' do
  before do
    assign(:appointment, Appointment.new)
    assign(:doctors, Doctor.all)
    assign(:clinical_trials, ClinicalTrial.all)
  end

  I18n.available_locales.each do |locale|
    it { render; expect(rendered).not_to match /translation missing:/ }
  end
end
