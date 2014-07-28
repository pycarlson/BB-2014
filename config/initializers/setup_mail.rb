ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'test.com',
:authentication => :plain,
:user_name => 'pyluftig@gmail.com',
:password => 'atti2deX44'
}