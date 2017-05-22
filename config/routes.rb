Rails.application.routes.draw do
  resources :assistances do
  	collection {post :import}
  end
  resources :vouchers
  get 'welcome/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/users'=>'admin#users'
end
