require 'rails_helper'

describe ApplicationHelper, type: :helper do

  describe '#full_title' do
    context 'when not passing page title' do
      it 'should be the base title' do 
        expect(helper.full_title).to eq "Gru's plan"
      end
    end

    context 'with a page title' do
      it 'should have page and base title' do 
        expect(helper.full_title('Ordering')).to eq "Ordering | Gru's plan"
      end
    end
  end

end
