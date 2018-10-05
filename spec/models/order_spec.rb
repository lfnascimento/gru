require 'rails_helper'

describe Order, type: :model do
  
  describe 'validations' do
    it do 
      is_expected.to validate_numericality_of(:quantity)
        .only_integer
        .is_greater_than(0)
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:product) }
  end

end
