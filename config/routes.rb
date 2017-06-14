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

    get 'categories/new' => 'categories#new_category'
    resources :categories , only:[:index,:create,:edit,:update,:delete]

    get 'artists/new' => 'artists#new_artist'
    get 'artists' => 'artists#index_artist'
    get 'artists/:id/edit' => 'artists#edit_artist' , as: 'artists_edit'
    resources :artists,only:[:create,:update,:destroy]

    get 'albums/new' => 'albums#new_album'
    get 'albums' => 'albums#index_album'
    get 'albums/:id/edit' => 'albums#edit_album' , as: 'albums_edit'
    resources :albums,only:[:create,:update,:destroy]

    resources :photos
    get 'songs/new' => 'songs#new_song'
    get 'songs' => 'songs#index_song'
    get 'songs/:id/edit' => 'songs#edit_song' , as: 'songs_edit'
    resources :songs,only:[:index,:create,:edit,:update,:destroy]

    get 'bands/new' => 'bands#new_band'
    get 'bands' => 'bands#index_band'
    get 'bands/:id/edit' => 'bands#edit_band',as: 'bands_edit'
    resources :bands,only:[:index,:create,:edit,:update,:destroy]

    get 'users/new' => 'users#new_user'
    get 'users' => 'users#index_user'
    get 'user/:id/edit' => 'users#user_edit',as: 'user_edit'
    resources :users,only:[:create,:update,:destroy]
  end

  resources :bands
  resources :artists
  get 'album/:id' => 'albums#show' , as: 'album'

  #resources :categories


end
