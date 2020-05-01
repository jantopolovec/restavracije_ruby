Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :reservations
  resources :rooms
  resources :buildings
  
  root to:'buildings#index'

  get 'rezervacije' => 'reservations#rezervacije', as: :rezervacije
  get 'mybuildings' => 'buildings#mybuildings', as: :mybuildings
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :buildings, only: [:index, :show, :create, :destroy, :update]
      post 'authenticate', to: 'authentication#authenticate'
  end
end

  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  get 'auth/failure', to: redirect('/')
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
