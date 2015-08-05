class User < ActiveRecord::Base
	has_secure_password
	has_many :workouts
	has_many :histories

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, 
				uniqueness: true, 
				format: {
					with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
				}

	before_save :downcase_credentials

	def downcase_credentials
		self.email = email.downcase
		self.username= username.downcase
	end

	def generate_password_reset_token!
		update_attribute(:password_reset_token, SecureRandom.urlsafe_base64(48))
	end
end
