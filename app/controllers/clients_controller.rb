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
			log_in @client	
			redirect_to client_path(@client.id)
			flash[:success] = "Welcome to Financial Freedom"
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

		if @client.balance > 0
			redirect_to client_path(@client.id)
		else
			@client.destroy!
			redirect_to clients_path
		end
	end


	


	private


	def client_params
		params.require(:client).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	end

	def account_params
		params.require(:account).permit(:balance, :account_number, :client_id)
	end

end
