FactoryBot.define do
  sequence(:uid) { |n| n }

  factory :user do
    uid
    provider { 'reddit' }
    name { 'Agnes' }
    email { 'agnes@evilproject.com' }
  end
end
