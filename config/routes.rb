Rails.application.routes.draw do
  root 'providers#homepage'
 
  concern :reviewable do
    resources :ratings, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :reviews, only: [:show, :edit, :update, :create, :destroy]
  end
    
  resources :providers,                                 :concerns => :reviewable

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

end
