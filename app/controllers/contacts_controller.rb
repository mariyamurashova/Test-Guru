class ContactsController < ApplicationController

  def new
   
  end

  def create
    contact = params.permit(:name, :email, :message)
    #byebug
      if ContactMailer.send_mail(contact).deliver_now
        redirect_to root_path, notice: t('.success')
      else
        render :new
      end
  end

  private

end
