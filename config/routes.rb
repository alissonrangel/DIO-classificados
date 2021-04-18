Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#show"
  
  # get "/users/new", to: "users#new"
  # post "/users", to: "users#create"

  resources :users, only: [:new, :create]
  '''
  get "users/:id/edit", to: "users#edit"
  patch "/users/:id", to: "users#update"
  put "/users/:id", to: "users#update"
  delete "/users/:id", to: "users#destroy"
  get "/users", to: "users#index"
  get "users/:id", to: "users#show"
  '''

  # get "/sessions/new", to: "sessions#new"
  get "/sessions/logout", to: "sessions#logout"
  
  resources :sessions, only: [:new, :create] do
    member do
      # "/sessions/:id"
    end
    collection do 
      # "/sessions/"
      delete "sign_out", to: "sessions#destroy", as: "sign_out"
    end
  end

  resources :ads, only:[:new, :create, :edit, :update]
end
