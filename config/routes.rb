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
    resources :artists,only:[:index,:create,:edit,:update,:delete]

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
    resources :bands,only:[:index,:create,:edit,:update,:destroy]
  end


  resources :artists
  #resources :categories
  #resource :albums

end
