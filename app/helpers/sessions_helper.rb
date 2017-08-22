module SessionsHelper
	
	# Logs in the given client.
  def log_in(client)
    session[:client_id] = client.id
  end

end
