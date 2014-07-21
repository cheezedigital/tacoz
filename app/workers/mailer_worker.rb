class MailerWorker
  include Sidekiq::Worker

  def perform(name, email, subject, quesiton)
    params = {name: name, email: email, subject: subject, question: question}
    ContactMailer.contact_request(params).deliver
  end

end
