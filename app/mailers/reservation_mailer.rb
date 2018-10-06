class ReservationMailer < ApplicationMailer
  default from: 'notifications@gruplans.com'
  layout 'mailer'
 
  def order_email(order)
    @order = order
    mail(to: ['miguel@inventosdigitais.com.br', 'nascimento.lsfo@gmail.com'], subject: t('reservation_mailer.order_email.subject'))
  end
end
