class Account < ApplicationRecord
  belongs_to :client
  has_many :transactions

  validates :client, presence: true
  validates :account_number, presence: true, uniqueness: true
  validates :balance, presence: true, numericality: true

  before_validation :load_defaults

  def load_defaults
  	if :balance.nil? && :account_number.nil?
  		self.balance = 0.00;
  		self.account_number = self.id
  	end
  end

  def to_s
  	account_number 
  end


end
