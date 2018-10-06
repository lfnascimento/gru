class ReservationMailerPreview < ActionMailer::Preview
  
  def order_email
    ReservationMailer.order_email(Order.first)
  end

end
