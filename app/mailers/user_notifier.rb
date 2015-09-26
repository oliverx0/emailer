class UserNotifier < ApplicationMailer
  default :from => '"Reinaldo Hoffman" ojh22@cornell.edu'
  self.delivery_method = :postmark

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Confirma tu registro'
    )
  end
end
