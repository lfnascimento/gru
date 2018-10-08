require 'rails_helper'

describe User, type: :model do

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:uid) }
  end

  describe '.from_omniauth' do

    context 'when user is not persisted' do
      let(:user_attr) { attributes_for(:user) }
      let(:auth_hash_info) { double(user_attr.except(:uid)) }
      let(:auth_hash) do
        double(
          provider: user_attr[:provider],
          uid: user_attr[:uid],
          info: auth_hash_info
        )
      end

      it { expect { described_class.from_omniauth(auth_hash) }.to change(User, :count).by(1) }
    end

    context 'when user is already persisted' do
      let!(:user) { create(:user) }
      let(:auth_hash) do
        double(
          provider: user.provider,
          uid: user.uid
        )
      end

      it { expect { described_class.from_omniauth(auth_hash) }.to_not change(User, :count) }
    end

  end
end
