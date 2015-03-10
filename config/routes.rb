Rails.application.routes.draw do
  devise_for :users

  patch '/metros/:station/favorite'   => 'metros#favorite'
  patch '/metros/:station/unfavorite' => 'metros#unfavorite'

  get '/buses' => 'buses#index'

  get   '/bikes'                      => 'bikes#index'
  get   '/favorites/bikes'            => 'bikes#favorites'
  patch '/bikes/:location/favorite'   => 'bikes#favorite'
  patch '/bikes/:location/unfavorite' => 'bikes#unfavorite'

  root 'application#home'
end
