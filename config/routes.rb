Rails.application.routes.draw do
  get '/api', to: 'spots#spots'
end
