Rails.application.routes.draw do
  resources :audit_logs
  namespace :admin do
      resources :posts
      resources :users
      resources :admin_users

      root to: "posts#index"
    end
  resources :posts
  devise_for :users, skip: [:registrations]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root "statics#home"
end
