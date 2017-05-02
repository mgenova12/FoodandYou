Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/dashboard' => 'dashboards#index'

  namespace :api do 
    namespace :v1 do 
      get '/dashboard' => 'dashboards#index'
      get '/dashboard/search' => 'dashboards#search'
    end
  end

  get '/profile' => 'profiles#index'
  get '/profile/edit' => 'profiles#edit'
  patch '/profile' => 'profiles#update'
  
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy"

end
