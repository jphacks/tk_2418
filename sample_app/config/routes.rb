Rails.application.routes.draw do
  # Users routes
  get '/api/users', to: 'users#index'                     # Get all users
  post '/api/users', to: 'users#create'                   # Create a new user (without login)
  get '/api/users/:id', to: 'users#show'                  # Get user by ID
  put '/api/users/:id', to: 'users#update'                # Update user by ID
  delete '/api/users/:id', to: 'users#destroy'            # Delete user by ID
  post '/api/users/signup', to: 'users#signup'            # User signup with auto-login
  post '/api/users/login', to: 'users#login'              # User login

  # Communities routes
  post '/api/communities', to: 'communities#create'                  # Create a new community
  get '/api/communities/:id', to: 'communities#show'                 # Get a community by ID
  post '/api/communities/:id/join', to: 'communities#join'           # Join a community

  # Messages routes
  get '/api/communities/:community_id/messages', to: 'messages#index'   # Get all messages in a community
  post '/api/communities/:community_id/messages', to: 'messages#create' # Create a new message in a community

  # Papers routes
  get '/api/papers', to: 'papers#index'                  # Get all papers
  post '/api/papers', to: 'papers#create'                # Create a new paper
  get '/api/papers/:id', to: 'papers#show'               # Get a paper by ID
  get '/api/papers/recommend', to: 'papers#recommend'    # Get recommended papers for today
end
