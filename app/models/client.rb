class Client < ApplicationRecord
	has_one :account
	has_secure_password

	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	

	before_save :format_name

	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def to_s
		"#{first_name} #{last_name}"
	end
end
