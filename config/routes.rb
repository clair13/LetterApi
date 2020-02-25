Rails.application.routes.draw do
  namespace :api do
    get '/letters' => 'letters#index'
  end
end
