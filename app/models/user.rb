class User < ActiveRecord::Base
  validates :email, :uniqueness => true, :presence => true

  after_save :send_confirmation_email, :unless => :verified?

  def send_confirmation_email
    UserNotifier.send_signup_email(self).deliver
  end
end
