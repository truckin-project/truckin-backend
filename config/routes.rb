Rails.application.routes.draw do
  namespace 'api', constraints: { format: 'json' } do
    namespace 'v1' do
      post 'validate_phone', to: 'authentication#start'
      post 'authenticate', to: 'authentication#authenticate'

      resources :users, only: [:create]
      resources :stop_points, only: [:index]
    end
  end
end
