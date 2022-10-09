class UserMailer < ApplicationMailer
   def welcome_email(code)
    @code = code 
    mail(to: 'vino0908@outlook.com', subject: 'Welcome to My Awesome Site')
  end
end
