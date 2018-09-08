Rails.application.routes.draw do
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users do
    resources :profile
  end
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :tops, only: [:index]
  
  root to: 'tops#index'
  
  resources :schedules
  
end
