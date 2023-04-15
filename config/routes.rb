Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.

  root to: "items#index"
  resources :items do
   resources :buys,only:[:index, :create]
  end
end
