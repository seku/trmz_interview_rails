Rails.application.routes.draw do
  root 'tweets#index'
  resources :settings, except: [:edit, :update, :show]
  match "/jobs" => DelayedJobWeb, :anchor => false, via: [:get, :post]
end
