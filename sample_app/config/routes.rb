Rails.application.routes.draw do
  namespace :api do
    # Users routes
    get '/users/index', to: 'users#index'
    post '/users', to: 'users#create'
    get '/users/:id', to: 'users#show'
    put '/users/:id', to: 'users#update'
    delete '/users/:id', to: 'users#destroy'

    # Communities routes
    post '/communities', to: 'communities#create'                  # Create a new community
    get '/communities/:id', to: 'communities#show'                 # Get a community by ID
    post '/communities/:id/join', to: 'communities#join'           # Join a community

    # Messages routes
    get '/communities/:community_id/messages', to: 'messages#index'   # Get all messages in a community
    post '/communities/:community_id/messages', to: 'messages#create' # Create a new message in a community

    # Papers routes
    get '/papers', to: 'papers#index'
    post '/papers', to: 'papers#create'
    get '/papers/:id', to: 'papers#show'
    get '/papers/recommend', to: 'papers#recommend'
  end
end
