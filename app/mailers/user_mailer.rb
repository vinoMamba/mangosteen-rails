class UserMailer < ApplicationMailer
   def welcome_email
    # @user = params[:user]
    # @url  = 'http://example.com/login'
    mail(to: 'vino0908@outlook.com', subject: 'Welcome to My Awesome Site')
  end
end
