require 'rails_helper'

describe '/home/clinical_research.haml' do
  before { assign(:clinical_trials, ClinicalTrial.all) }

  I18n.available_locales.each do |locale|
    it { render; expect(rendered).not_to match /translation missing:/ }
  end
end
