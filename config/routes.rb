Rails.application.routes.draw do
  get 'users/info', to: 'users#info'
  post 'users/charge', to: 'users#charge'
  get 'users/cancel_subscription', to: 'users#cancel_subscription'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: "home#index"
  resources :publications, only: [:index, :show]
  namespace :admin do
    resources :publications
  end
end
