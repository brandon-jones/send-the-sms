class SendSmsController < ApplicationController


  def index
  end

  def send_message
    phone_number = params['phone_number']
    message = params['message']
    if phone_number.nil? || message.nil?
      flash[:error] = "Must include a phone number AND message"
    else
      easy = SMSEasy::Client.new
      SMSEasy::Client.config['from_address'] = "noreply@example.com"
      if easy.deliver(params["phone_number"], params["phone"]["carrier"], params["message"], :from => params["email-from"])
        flash[:notice] = "Message sent successfully"
      else
        flash[:error] = "There was a problem sending your message"
      end
    end
    redirect_to root_path
  end

end