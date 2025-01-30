Rails.application.routes.draw do
  get "storefront/index"
  delete '/products:id', to: 'products#destroy'
  patch '/products:id', to: 'products#update'
  post '/products', to: 'products#create'
  get '/products/:id/edit', to: 'products#edit', as: :edit_product
  get '/products', to: 'products#index'
  get '/products:id', to:'products#show', as: :product
  get '/products/new', to:'products#new', as: :new_product

  get '/storefront', to: 'storefront#index', as: :storefront
end
