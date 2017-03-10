Rails.application.routes.draw do
  root 'spots#home'
  get '/api', to: 'spots#api'
end
