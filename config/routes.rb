HackspaceManagementSystem::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :hs_sessions, only: :create
    end
  end

  resources :hs_sessions, only: :create
  devise_for :users
  root "home#index"
end
