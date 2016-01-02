class SendSmsController < ApplicationController


  def index
  end

  def send_message
    phone_number = params['phone_number']
    message = params['message']
    if phone_number.nil? || message.nil?
      flash[:error] = "Must include a phone number AND message"
    else
      flash[:notice] = "Message sent successfully"
      # do something with the info
    end
    redirect_to root_path
  end

end