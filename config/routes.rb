# == Route Map
#
#       Prefix Verb   URI Pattern                  Controller#Action
# sessions_new GET    /sessions/new(.:format)      sessions#new
#         root GET    /                            pages#home
#        users POST   /users(.:format)             users#create
#     new_user GET    /users/new(.:format)         users#new
#    edit_user GET    /users/:id/edit(.:format)    users#edit
#         user GET    /users/:id(.:format)         users#show
#              PATCH  /users/:id(.:format)         users#update
#              PUT    /users/:id(.:format)         users#update
#     whistles POST   /whistles(.:format)          whistles#create
#  new_whistle GET    /whistles/new(.:format)      whistles#new
# edit_whistle GET    /whistles/:id/edit(.:format) whistles#edit
#      whistle GET    /whistles/:id(.:format)      whistles#show
#              PATCH  /whistles/:id(.:format)      whistles#update
#              PUT    /whistles/:id(.:format)      whistles#update
#        login GET    /login(.:format)             session#new
#              POST   /login(.:format)             session#create
#              DELETE /login(.:format)             session#destroy
#

Rails.application.routes.draw do
  root :to => 'pages#home'

  get '/users/edit' => 'users#edit', :as => 'edit_user'
  get '/users/:id/relationships' => 'users#relationships', as: :create_relationship
  delete '/users/:id/destroy_relationship' => 'users#destroy_relationship', as: :destroy_relationship
  resources :users, :only => [:new, :create, :show, :update, :index]
  resources :whistles

  resources :whistles do
    put :star, on: :member
  end

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :whistles
  resources :tags, only: [:index, :show]
end
