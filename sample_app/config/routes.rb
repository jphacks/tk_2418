Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/create'
  get 'users/update'

  get 'community/create'
  get 'community/show'
  get 'community/join'
  
  get 'papers/index'
  get 'papers/show'
  get 'papers/recommend'

  get 'message/index'
  get 'message/create'
end
