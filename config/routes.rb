Rails.application.routes.draw do
  root to: 'tops#index'
  
  resources :users do
    get :mypage, on: :member
    get :mypage_edit, on: :member
    get '/logout' => 'sessions#destroy'
  end
  
  resources :sessions, only:[:new, :create, :destroy]
  
  resources :tops, only: [:index]
  
  resources :schedules
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
  # root to: 'calendar#index'
  # get 'calendar/index'
  # get 'schedules', to: 'schedule#show'
  # post 'schedules/create', to: 'schedule#create'
  
end
