class UserMailer < ApplicationMailer:Base
 default :from => "1906157348@qq.com"

 def welcome_email(user)
  @user = user
  # @url
  mail(:to => user.email, :subject => "欢迎来到我的程序" )
 end
end
