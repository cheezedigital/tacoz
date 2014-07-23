class ContactMailer < ActionMailer::Base
  default from: "contact-request@tacoz.com"

  def contact_request(params)
    @params = params
    mail(to: 'admin@tacoz.com', subject: 'New Contact Request')
  end

  def send_report(stats_hash)
    @stats_hash = stats_hash
    mail(to: 'me@tacoz.com', subject: 'Daily Report')
  end
end
