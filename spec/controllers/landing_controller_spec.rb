require 'rails_helper'

describe LandingController, type: :controller do

  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with(:success) }
  end

end
