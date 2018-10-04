class User < ApplicationRecord

  devise :omniauthable, omniauth_providers: %i[facebook]
  
  validates :email, :uid, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
    end
  end

end
