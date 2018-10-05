require 'rails_helper'

describe Users::OmniauthCallbacksController, type: :controller do

  describe 'POST #facebook' do

    before do
      request.env['devise.mapping'] = Devise.mappings[:user]
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
      post :facebook, params: { provider: 'facebook' }
    end
    
    it do
      is_expected.to redirect_to root_url
      is_expected.to set_session
      is_expected.to set_flash[:notice]
    end

  end

end
