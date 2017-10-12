Rails.application.routes.draw do
  root 'users/sessions#new'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
