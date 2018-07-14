Rails.application.routes.draw do
  get 'favorites/create'

  get 'favorites/destroy'

  get 'sessions/new'

  resources :pictures
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
end
