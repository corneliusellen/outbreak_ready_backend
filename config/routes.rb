Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/tags', to: 'tags#index'
      namespace :search do
        get '/restaurants', to: 'restaurants#index'
        get '/menus', to: 'menus#index'
      end
    end
  end
end
