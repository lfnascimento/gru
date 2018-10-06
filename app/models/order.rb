class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  delegate :name, to: :user, prefix: true

  after_create :send_reservation_email

  private

  def send_reservation_email
    ReservationMailer.order_email(self).deliver_later
  end

end
