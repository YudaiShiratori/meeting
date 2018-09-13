Rails.application.routes.draw do
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  resources :users do
    get :mypage, on: :member
  end
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :tops, only: [:index]
  
  root to: 'tops#index'
  
  resources :schedules
  
  root to: 'calendar#index'
  get 'calendar/index'
  get 'schedules', to: 'schedule#show'
  post 'schedules/create', to: 'schedule#create'
  
end
