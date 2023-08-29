class ContactMailerPreview < ActionMailer::Preview
     def contact
     contact = Contact.new(name: "User", message: "Contact")

     ContactMailer.send_mail(contact)
   end

end
