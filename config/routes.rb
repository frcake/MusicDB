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
    resources :albums,only:[:index,:create,:edit,:update,:delete]
    resources :photos
    get 'songs/new' => 'songs#new_song'
    resources :songs,only:[:index,:create,:edit,:update,:delete]
    get 'bands/new' => 'bands#new_band'
    resources :bands,only:[:index,:create,:edit,:update,:delete]
  end



  resources :categories

end
