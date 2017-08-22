Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


root to: 'pages#index'

resources :clients do
	resources :accounts
end


get '/signup' => 'clients#new'
post '/clients' => 'clients#create'

namespace :api do
	namespace :v1 do
		post 'accounts/new_transaction', to: 'accounts#new_transaction'
	end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
