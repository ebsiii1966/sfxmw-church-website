class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      flash.now.notice = "Message was successfully sent."
      # redirect_to(root_path, :notice => "Message was successfully sent.")
      render :new
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
  end
  
end
