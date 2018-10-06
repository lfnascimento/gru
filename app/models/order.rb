class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  delegate :name, to: :user, prefix: true
end
