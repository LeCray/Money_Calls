Rails.application.routes.draw do

root to: 'pages#index'
resources :accounts
resources :clients
resources :profiles

get '/signup' => 'clients#new'
post '/clients' => 'clients#create'

namespace :api do
	namespace :v1 do
		post 'accounts/new_transaction', to: 'accounts#new_transaction'
	end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
