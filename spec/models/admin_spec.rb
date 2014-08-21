require 'rails_helper'

describe Admin do
  describe 'validations' do
    it { expect(build(:admin)).to be_valid }
  end
end
