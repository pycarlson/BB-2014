class UserMailer < ActionMailer::Base
  def adoption_confirmation(user, family)
    @user = user
    @dl = @user.drop_location
    @dd = @user.drop_date
    @family = family
    mail :to => @user.email, :from => 'adopt-a-family@brighter-beginnings.org', :subject => "Thank you from Brighter Beginnings"
  end
end
