Rails.application.routes.draw do
  get '/buses' => 'buses#index'
  get '/bikes' => 'bikes#index'

  root 'application#home'
end
