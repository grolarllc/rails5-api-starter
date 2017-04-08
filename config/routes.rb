Rails.application.routes.draw do

  root to: 'home#show'

  scope module: 'api' do
    mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      resources :users, only: [:index, :show]
    end
  end

end
