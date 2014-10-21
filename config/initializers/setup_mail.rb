ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'http://adopt-a-family-program.herokuapp.com/',
:authentication => :plain,
:user_name => ENV["BB_EMAIL"],
:password => ENV["BB_PASSWORD"]
}

ActionMailer::Base.default_url_options[:host] = "http://adopt-a-family-program.herokuapp.com/"

