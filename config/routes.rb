Rails.application.routes.draw do

  root 'sessions#new'

  resources :teachers

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/admin' => 'admins#control_panel'
  get '/admin/students' => 'admins#students'

  resources :teams, only: [:show, :index, :update]
  resources :students do
    collection do
      post 'upload' => 'students#upload'
    end
  end

  resources :access_codes, only: [:update]

end

