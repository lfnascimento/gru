FactoryBot.define do
  factory :order do
    quantity { 1 }
    observation { 'Few Minions. Just 1000x' }
    user
    product
  end
end
