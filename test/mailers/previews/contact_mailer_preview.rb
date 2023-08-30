class ContactMailerPreview < ActionMailer::Preview
     def contact
     contact ="name: "User", message: "Contact""

     ContactMailer.send_mail(contact)
   end

end
