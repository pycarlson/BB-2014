class UserMailer < ActionMailer::Base
  def adoption_confirmation(user)
    p "*" * 100
    p "I'm in the mail to function"
    @user = user
    mail :to => user.email, :from => 'pyluftig@gmail.com', :subject => "Congratulations on your Adopt-a-Family Adoption!"
  end
end
