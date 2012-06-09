class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    begin  
      Twitter.update(status)
    rescue
      success = false
    else 
      success = true  
    end
    
    
    
    if @message.valid?
      begin
        NotificationsMailer.new_message(@message).deliver
        flash.now.notice = "Message was successfully sent."
        # redirect_to(root_path, :notice => "Message was successfully sent.")
        render :new
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
        flash.now.alert = "Message delivery failed, please try again later."
        render :new
      end
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
  end
  
end
