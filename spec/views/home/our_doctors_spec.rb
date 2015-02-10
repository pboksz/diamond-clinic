require 'rails_helper'

describe '/home/our_doctors.haml' do
  before { assign(:doctors, Doctor.all) }

  I18n.available_locales.each do |locale|
    it { render; expect(rendered).not_to match /translation missing:/ }
  end
end
