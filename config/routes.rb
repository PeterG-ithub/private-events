Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :events
  resources :attendances, only: [:create], as: 'join_events'
  resources :attendances, only: [:destroy], as: 'leave_event'
  root "events#index"
end
