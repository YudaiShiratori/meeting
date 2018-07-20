Rails.application.routes.draw do

  resources :pictures do
    collection do
      get :top
    end
    resources :comments
  end
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
  root to: 'pictures#top'
  
end
