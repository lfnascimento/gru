class ReservationMailer < ApplicationMailer
  default from: 'nascimento.lsfo@gmail.com'
  layout 'mailer'
 
  def order_email(order)
    @order = order
    mail(to: 'nascimento.lsfo@gmail.com', subject: t('reservation_mailer.order_email.subject'))
  end
end
