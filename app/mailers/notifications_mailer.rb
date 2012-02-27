class NotificationsMailer < ActionMailer::Base
  
  default :from => "noreply@sfxmw.net"
  default :to => "ed@mwscotts.com"

  def new_message(message)
    @message = message
    mail(:subject => "SFXMW.COM #{message.subject}", :to => message.get_to_address)
  end  
  
end
