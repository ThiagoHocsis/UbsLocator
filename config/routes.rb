Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/find_ubs' => 'health_units#index'
    end
  end
end
