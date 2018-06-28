Rails.application.routes.draw do
  resources :pictures
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/inbox'
  end
  
end
