HackspaceManagementSystem::Application.routes.draw do
  resources :hs_sessions, only: :create
  devise_for :users
  root "home#index"
end
