Rails.application.routes.draw do
  resources :assistances do
  	collection {post :import}
  end
  resources :vouchers
  get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #get '/users'=>'admin#index'
   get '/lock_unlock' => 'admin#lock_unlock'
  get '/user' => 'admin#index'
  get '/user/new' => 'admin#new'
  get '/user/:id/edit_password' => 'admin#edit_password'
  post '/user/:id/update_password' => 'admin#update_password'
  post '/user' => 'admin#create'
end
