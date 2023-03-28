Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.

  root to: "items#index"
  
  resources :itms, only: :index


end
