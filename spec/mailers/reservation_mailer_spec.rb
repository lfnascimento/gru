require 'rails_helper'

describe ReservationMailer, type: :mailer do
  describe '.order_email' do
    let(:order) { build_stubbed(:order) }
    let(:mail) { described_class.order_email(order) }

    it 'renders the headers' do
      expect(mail.subject).to eq(I18n.t('reservation_mailer.order_email.subject'))
      expect(mail.from).to eq(['notifications@gruplan.com'])
      expect(mail.to).to eq(["to@example.org"])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match(I18n.t('reservation_mailer.order_email.subject'))
    end
  end
end

