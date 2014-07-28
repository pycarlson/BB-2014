ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'test.com',
:authentication => :plain,
:user_name => ENV["P_EMAIL"],
:password => ENV["P_PASSWORD"]
}