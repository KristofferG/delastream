Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :packages do
    resources :comments
  end

  resources :users do
    resources :have_lists
    resources :wants_lists
  end

  resources :have_lists do
    resources :packages
  end

  resources :wants_lists do
    resources :packages
  end

  root 'welcome#index'
end
