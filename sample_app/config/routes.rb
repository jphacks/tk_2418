Rails.application.routes.draw do
  get 'papers/index'
  get 'papers/show'
  get 'papers/recommend'
  root "static_pages#home"
  get  "/help",    to: "static_pages#help"
  get  "/about",   to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  get  "/signup",  to: "users#new"
end
