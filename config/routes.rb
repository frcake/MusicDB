Rails.application.routes.draw do
  root 'application#index'

  get 'sessions/new'

  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'admin/dashboard' => 'admin#index'
  #The namespace  creates a nested url for admin panel check rake routes for details
  namespace :admin do
    get 'albums/new' => 'albums#new_album'
    get 'categories/new' => 'categories#new_category'
    get 'artists/new' => 'artists#new_artist'
    resources :artists,only:[:index,:create,:edit,:update,:delete]
    resources :categories , only:[:index,:create,:edit,:update,:delete]
    get 'albums' => 'albums#index_album'
    resources :albums,only:[:create,:edit,:update,:destroy]
    resources :photos
    get 'songs/new' => 'songs#new_song'
    get 'songs' => 'songs#index_song'
    resources :songs,only:[:index,:create,:edit,:update,:destroy]
    get 'bands/new' => 'bands#new_band'
    get 'bands' => 'bands#index_band'
    resources :bands,only:[:index,:create,:edit,:update,:destroy]
  end


  resources :artists
  resources :categories

end
