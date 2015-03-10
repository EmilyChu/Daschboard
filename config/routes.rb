Rails.application.routes.draw do
  devise_for :users
  get '/buses' => 'buses#index'
  get '/bikes' => 'bikes#index'
  get '/metro' => 'metro#index'

  root 'application#home'

end
