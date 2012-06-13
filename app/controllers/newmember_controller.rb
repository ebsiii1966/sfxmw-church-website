class NewmemberController < ApplicationController

  def new
    @newmember = Newmember.new
  end

  def create
    @newmember = Newmember.new(params[:newmember]) 
    if @newmember.valid?
      begin
        logger.info "Calling NotificationsMailer.new_member"
        NotificationsMailer.new_member(@newmember).deliver
        flash.now.notice = "Form was successfully sent."
        # redirect_to(root_path, :notice => "Message was successfully sent.")
        render :new
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join("\n")
        flash.now.alert = "Form delivery failed, please try again later."
        render :new
      end
    else
      flash.now.alert = "Please fill in all fields."
      render :new
    end
  end
  
end
