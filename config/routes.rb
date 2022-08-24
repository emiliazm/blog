Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }
  root to: "users#index"

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

end
