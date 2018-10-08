require 'rails_helper'

describe 'Ordering', type: :system do

  context 'when unauthorized' do
    before { visit new_order_path }

    it 'should be redirected to root path' do
      expect(page.current_path).to eq root_path
      expect(page).to have_content I18n.t('devise.failure.unauthenticated')
    end
  end

  context 'when unauthorized and with http_auth' do
    before do
      allow_any_instance_of(CustomFailure).to receive(:http_auth?) { true }
      visit new_order_path
    end

    it 'should not be redirected to root path' do
      expect(page.current_path).to_not eq root_path
      expect(page).to have_content I18n.t('devise.failure.unauthenticated')
    end

  end

  context 'when creating an order successfully' do
    let(:user) { create(:user) }
    let!(:product) { create(:product) }

    before do
      login_as(user, scope: :user)
      visit new_order_path
    end

    it 'should create a new order' do

      fill_in 'order_quantity', with: 3
      fill_in 'order_observation', with: 'Greate Minions'
      click_button('Criar Pedido')

      expect(page.current_path).to eq root_path
    end

  end

end
