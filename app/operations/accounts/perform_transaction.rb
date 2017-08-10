module Accounts
	class PerformTransaction

		def initialize(amount:, transaction_type:, account_id:)
			@amount 		   = amount.try(:to_f)
			@transaction_type  = transaction_type
			@account_id 	   = account_id
			@account           = Account.where(id: @account_id).first
		end

		def execute!
			Transaction.create!(
				account: @account,
				amount: @amount,
				transaction_type: @transaction_type
			)

			if @transaction_type == 'Withdraw'
				@account.update!(balance: @account.balance - @amount)
			elsif @transaction_type == 'Deposit'
				@account.update!(balance: @account.balance + @amount)				
			end

			@account
		end
	end
end
