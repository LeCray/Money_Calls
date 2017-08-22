class Client < ApplicationRecord
	attr_accessor :remember_token, :activation_token
	before_save   :downcase_email
	before_create :create_activation_digest

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


	private

    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Client.new_token
      self.activation_digest = Client.digest(activation_token)
    end
end
