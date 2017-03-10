Rails.application.routes.draw do
  mount GrapeSwaggerRails::Engine => "/"
  get '/api', to: 'spots#api'
end
