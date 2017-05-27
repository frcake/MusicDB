Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'admin/dashboard' => 'admin#index'
  #The namespace  creates a nested url for admin panel check rake routes for details
  namespace :admin do
    get 'album/new' => 'albums#new_album'
    get 'categories/new' => 'categories#new_category'
    get 'artists/new' => 'artists#new_artist'
    resources :albums,only:[:index,:create,:edit,:update,:delete]
    resources :artists,only:[:index,:create,:edit,:update,:delete]
    resources :categories , only:[:index,:create,:edit,:update,:delete]
    resources :photos
  end



  resources :categories

end
