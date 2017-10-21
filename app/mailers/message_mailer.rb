class MessageMailer < ApplicationMailer
  default from: "MM Messenger <fashionclubdev@gmail.com>"

  def seen_notice(recipient, message)
    @recipient = recipient
    mail(to: message.user.email, subject: 'Your message has been seen')
  end

  def sent_notice(recipient, message)
    @message = message
    mail(to: recipient.email, subject: 'You just recieved a message')
  end
end
