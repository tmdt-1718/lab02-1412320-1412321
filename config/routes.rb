Rails.application.routes.draw do
  root 'messages#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/friendlist', to: 'users#friendlist'

  resources :users, only: [ :member ] do
  	get 'home'
    get :friendship
  end
  resources :relationships, only: [:create, :destroy, :update]

  resources :conversations, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  resources :messages, only: [:index, :sent, :show, :create] do
    collection do
      get 'sent'
    end
  end
end
