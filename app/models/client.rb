class Client < ApplicationRecord
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :client_number, presence: true, uniqueness: true

	before_save :format_name

	def format_name
		self.first_name = self.first_name.capitalize
		self.last_name = self.last_name.capitalize
	end

	def to_s
		"#{first_name} #{last_name}"
	end
end
