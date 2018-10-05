require 'rails_helper'

describe Product, type: :model do
  
  describe 'validations' do
    it { is_expected.to validate_presence_of(:short_description) }
    it { is_expected.to validate_presence_of(:serial_number) }
    it { is_expected.to validate_uniqueness_of(:serial_number) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end

end
