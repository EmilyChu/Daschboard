Rails.application.routes.draw do
  devise_for :users

  get '/buses' => 'buses#index'

  get   '/bikes'                      => 'bikes#index'
  get   '/favorites/bikes'            => 'bikes#favorites'
  patch '/bikes/:location/favorite'   => 'bikes#favorite'
  patch '/bikes/:location/unfavorite' => 'bikes#unfavorite'

  root 'application#home'
end
