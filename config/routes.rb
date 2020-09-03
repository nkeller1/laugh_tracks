Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get '/comedians', to: 'comedians#index'
    end
  end
end
