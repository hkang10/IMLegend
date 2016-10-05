Rails.application.routes.draw do
  resources :teams, only: [:show, :index]
  resources :students
  root to: "students#temp"
end
