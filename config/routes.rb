Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/dashboard' => 'dashboards#index'

  namespace :api do 
    namespace :v1 do 
      get '/dashboard' => 'dashboards#index'
      get '/dashboard/search' => 'dashboards#search'

      get '/dashboard/added_foods' => 'added_foods#index'
      post '/dashboard/added_foods' => 'added_foods#create'
      get '/dashboard/added_foods/:id' => 'added_foods#show'
      delete '/dashboard/added_foods/:id' => 'added_foods#destroy'

      get '/dashboard/meals' => 'meals#index'
      post '/dashboard/meals' => 'meals#create'
      get '/dashboard/meals/:id' => 'meals#show'
      
    end
  end

  get '/my_meals' => 'my_meals#index'
  get '/my_meals/:id' => 'my_meals#show'

  get '/profile' => 'profiles#index'
  get '/profile/edit' => 'profiles#edit'
  patch '/profile' => 'profiles#update'
  
  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "logout" => "sessions#destroy"

end
