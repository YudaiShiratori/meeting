Rails.application.routes.draw do
  get 'sessions/new'

  resources :pictures
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]
  
end
