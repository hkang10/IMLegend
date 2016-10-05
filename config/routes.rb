Rails.application.routes.draw do


  root 'sessions#new'
  resources :teachers

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'


  resources :teams, only: [:show, :index]
  resources :students

end
