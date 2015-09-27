class UserNotifier < ApplicationMailer
  default :from => '"Reinaldo Hoffman" ojh22@cornell.edu'


  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    self.delivery_method = :postmark
    @user = user
    mail( :to => @user.email,
          :subject => 'Confirma tu registro'
    )
  end

  def send_answer_email(title, message, user)
    self.delivery_method = :smtp
    @message = message
      mail( :to => user.email,
            :subject => title
      )
  end

  def notify_selected(title, email)
    self.delivery_method = :postmark
    @title = title
    @name = User.find_by(email: email).name
    mail( :to => email,
          :subject => 'Tu mensaje ha sido seleccionado!'
    )
  end

end
