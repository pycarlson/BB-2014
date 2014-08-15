ActionMailer::Base.smtp_settings = {
:enable_starttls_auto => true,
:address => 'smtp.gmail.com',
:port => 587,
:domain => 'brighterbeginnings.com',
:authentication => :plain,
:user_name => ENV["P_EMAIL"],
:password => ENV["P_PASSWORD"]
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"