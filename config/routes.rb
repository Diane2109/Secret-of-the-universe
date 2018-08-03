Rails.application.routes.draw do


  root to: 'static#index'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/sessions',   to: 'sessions#new'
  post    '/sessions',   to: 'sessions#create'
  get    '/sessions/:id',   to: 'sessions#show', as: "show_id"
  post    '/users/new',   to: 'users#create', as: "sign_up"
  get     'users/:id/edit', to: 'users#edit', as: "edit"
  post    '/users/:id/edit', to: 'users#edit_after', as: "edit_after"



  resources :users



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
