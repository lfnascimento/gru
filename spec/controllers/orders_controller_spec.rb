require 'rails_helper'

describe OrdersController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in(user) }

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to respond_with(:success) }
  end

  describe 'POST #create' do
    let(:product) { create(:product) }

    before { post :create, params: order_params }

    context 'with valid params' do
      let(:order_params) { { order: attributes_for(:order).merge(product_id: product.id) }}

      it do
        is_expected.to redirect_to(root_url)
        is_expected.to set_flash[:notice]
      end
    end

    context 'with invalid params' do
      let(:order_params) do
        { order: { observation: 'Invalid', quantity: 0 }
          .merge(product_id: product.id) }
      end

      it { is_expected.to render_template('new') }
    end
  end

end
