Rails.application.routes.draw do


  root 'sessions#new'
  resources :teachers

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/admin/:id' => 'teachers#show'
  get '/admin/index' => 'teachers#index'

  resources :teams, only: [:show, :index, :update]
  resources :students

end

