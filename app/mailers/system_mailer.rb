class SystemMailer < ApplicationMailer
  default from "no-reply@rottenmangoes.com"

  def welcome_email(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to Rotten Mangoes')


  end
end
