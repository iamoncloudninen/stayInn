Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    member do
      get :account_info
      get :profile_info
    end
  end   
  resources :rooms
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end