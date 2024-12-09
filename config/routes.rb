Rails.application.routes.draw do
  delete '/products:id', to: 'products#destroy'
  patch '/products:id', to: 'products#update'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
  get '/products', to: 'products#index'
  get '/products:id', to:'products#show', as: :product
  get '/products/new', to:'products#new', as: :new_product

  delete '/users:id', to: 'users#destroy'
  patch '/users:id', to: 'users#update'
  post '/users', to: 'users#create'
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  get '/users', to: 'users#index'
  get '/users:id', to:'users#show', as: :user
  get '/users/new', to:'users#new', as: :new_user
end
