Rails.application.routes.draw do

  resources :pictures do
    resources :comments
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
  resources :tops, only: [:index]
  
  root to: 'tops#index'
  
end
