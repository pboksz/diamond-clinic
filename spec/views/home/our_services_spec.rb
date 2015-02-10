require 'rails_helper'

describe '/home/our_services.haml' do
  I18n.available_locales.each do |locale|
    it { render; expect(rendered).not_to match /translation missing:/ }
  end
end
