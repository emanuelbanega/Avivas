Rails.application.routes.draw do
  devise_for :users

  # Storefront (accesible para todos)
  get '/storefront', to: 'storefront#index', as: :storefront
  root 'storefront#index'

  # Rutas de administración de usuarios
  namespace :admin do
    resources :users do
      member do
        patch :update_role
        patch :deactivate
      end
    end
  end

  # Rutas CRUD de productos (optimizado con resources)
  resources :products, except: [:destroy]
  delete '/products/:id', to: 'products#destroy', as: :delete_product
end
