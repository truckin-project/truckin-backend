Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :users, only: [:create]
      post 'validate_phone', to: 'authentication#start'
      post 'authenticate', to: 'authentication#authenticate'
    end
  end
end
