class Notifier < ApplicationMailer
	default_url_options[:host]= "jackedup-test.herokuapp.com"
	default from: "no-reply@jackedup.com"

	def password_reset(user)
		puts "Hello, logs 5!"
		@user = user
		mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
		subject: "Reset Your Password")
		puts "Hello, logs 6!"
	end
end
