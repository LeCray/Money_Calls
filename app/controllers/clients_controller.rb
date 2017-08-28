class ClientsController < ApplicationController

	def index
		@clients = Client.all
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		@account = @client.build_account(client_id: @client.id, balance: 0.00)
		
		if @client.save && @account.save 
			ClientMailer.account_activation(@client).deliver_now
      		flash.now[:info] = "Awesome. Now swing over to your emails to activate your account :)"
      		render 'new'

		else
			render 'new'
		end
	end

	def show
		@client = Client.find(params[:id])
	end


	def edit
	end

	def update
	end

	def destroy
		@client = Client.find(params[:id])
		@client.destroy!
		@account = @client.account
		@account.destroy!
		redirect_to clients_path
		
	end


	


	private


	def client_params
		params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def account_params
		params.require(:account).permit(:balance, :account_number, :client_id)
	end

end
