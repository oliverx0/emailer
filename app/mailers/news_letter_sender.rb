class NewsLetterSender < ApplicationMailer
  default :from => "\"Reinaldo Hoffman\" <ojh22@cornell.edu>"
  self.delivery_method = :smtp

  def send_answer_email(title, message, user)
    @message = message
      mail( :to => user.email,
            :subject => title
      )
  end

end
