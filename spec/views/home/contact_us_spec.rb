require 'rails_helper'

describe '/home/contact_us.haml' do
  I18n.available_locales.each do |locale|
    it { render; expect(rendered).not_to match /translation missing:/ }
  end
end
