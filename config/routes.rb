Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/comedians', to: 'comedians#index'
      get '/comedians/:id', to: 'comedians#show'
      post '/comedians', to: 'comedians#create'
    end
  end
end
