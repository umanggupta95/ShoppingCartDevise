Rails.application.routes.draw do

  require 'sidekiq/web'

  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations', :omniauth_callbacks => "users/omniauth_callbacks"
  }

  get '/user/show', to: 'users/registrations#show'

  mount Sidekiq::Web => '/sidekiq'

	root to: "welcome#new"
	resources :products
	resources :orders
	resources :carts, except: [:new, :create] do
    member do
      post :add_product
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
