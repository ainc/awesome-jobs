class ContactMailer < ActionMailer::Base
  default from: "bassanly.exe@gmail.com"

  def contact_form(sender, recipient, message)
    @user = sender
    @message = message
    if @message.size > 4000
      @message = @message[0..4000] + " \n #{I18n.t('message_truncated')}"
    end
    mail(to: recipient.email, subject: "#{I18n.t('contact_request')}: #{@user.username}")
  end
end
