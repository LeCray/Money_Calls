class SessionsController < ApplicationController
  
  def new
  end

  def create
  	render 'new'

  	client = Client.find_by(email: params[:session][:email].downcase)

  	if client && client.authenticate(params[:session][:password])
     	log_in client
     	redirect_to client
	else
     	flash.now[:danger] = 'Invalid email/password combination'
     	render 'new'  
    end
  
  end

end
