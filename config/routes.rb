Rails.application.routes.draw do
  get 'attending_events/create'
  root 'users#new'

  resources 'users', only: %i[new show create]
  resources 'events', only: %i[index new create show] do
    post '/attend', to: 'attending_events#create'
    get '/invite', to: 'attending_events#new'
    post '/invite', to: 'attending_events#create'
  end

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
