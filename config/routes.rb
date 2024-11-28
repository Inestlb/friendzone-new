Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :edit_mood
      patch :update_mood
      get :edit_vacation
      patch :update_vacation
      get :edit_life_choice
      patch :update_life_choice
    end
    resources :likes, only: [:create]
  end
  resources :matches, only: [:index, :show] do
    resources :messages, only: [:create]
  end
  resources :events, only: [:index, :show]
    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
