Rails.application.routes.draw do
  devise_for :users
  get '/buses' => 'buses#index'
  get '/bikes' => 'bikes#index'

  root 'application#home'
end
