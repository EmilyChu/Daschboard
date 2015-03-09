Rails.application.routes.draw do
  get '/buses' => 'buses#index'
  root 'application#home'
end
