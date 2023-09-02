class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact=contact
    mail to: "mariya09.2009@gmail.com"
  end
end
