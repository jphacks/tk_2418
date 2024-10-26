Rails.application.routes.draw do
  # Users routes
  get '/api/users/index', to: 'users#index'
  post '/api/users', to: 'users#create'
  get '/api/users/:id', to: 'users#show'
  put '/api/users/:id', to: 'users#update'
  delete '/api/users/:id', to: 'users#destroy'

  # Communities routes
  post '/api/communities', to: 'communities#create'                  # Create a new community
  get '/api/communities/:id', to: 'communities#show'                 # Get a community by ID
  post '/api/communities/:id/join', to: 'communities#join'           # Join a community

  # Messages routes
  get '/api/communities/:community_id/messages', to: 'messages#index'   # Get all messages in a community
  post '/api/communities/:community_id/messages', to: 'messages#create' # Create a new message in a community

  # Papers routes
  get '/api/papers', to: 'papers#index'
  post '/api/papers', to: 'papers#create'
  get '/api/papers/:id', to: 'papers#show'
  get '/api/papers/recommend', to: 'papers#recommend'
end
