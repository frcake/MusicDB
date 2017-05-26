Rails.application.routes.draw do
  get 'sessions/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'

  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #The namespace  creates a nested url for admin panel check rake routes for details
  namespace :admin do
    get 'album/new' => 'albums#new_album'
    resources :albums,only:[:create,:edit,:update,:delete]
  end
  get 'admin/dashboard' => 'admin#index'

  resources :categories

end
