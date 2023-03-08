Rails.application.routes.draw do
  resources :galleries

  root to: 'galleries#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
