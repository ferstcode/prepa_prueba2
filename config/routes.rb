Rails.application.routes.draw do
  get 'products', to: 'products#index'
  get 'products/favourites', to:'products#favourites', as: 'favourites'
  resources :products, only: [:create, :destroy, :edit]
  get 'products/:id', to: 'products#show', as: 'product_show'
  patch 'products/:id', to: 'products#update'
  patch 'products/:id/set_favourite', to: 'products#set_favourite', as: 'set_favourite'




  root 'products#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # patch 'products/:id/set_favourite'
end
