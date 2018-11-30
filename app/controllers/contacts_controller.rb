class ContactsController < ApplicationController
 
 def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver && @contact.valid?
      redirect_to root_path, :notice => "Transmission Sent. Thanks!"
    else
      redirect_to root_path, :alert => "Transmission Failed!"
    end
  end
end