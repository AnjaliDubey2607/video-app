Rails.application.routes.draw do
  # get 'watch_party/home'
  # get 'watch_party/login'
  # get 'watch_party/party'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'watch_party#home'
  get '/party', to: 'watch_party#party'
  post '/login', to: 'watch_party#login'
  get "/leave_call", to: "watch_party#leave_call"
  delete "end_call", to: "watch_party#end_call"
end
