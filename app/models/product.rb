class Product < ApplicationRecord
  
  has_many :orders, dependent: :destroy

  validates :serial_number, :short_description, presence: true
  validates :serial_number, uniqueness: true

end
