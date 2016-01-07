HackspaceManagementSystem::Application.routes.draw do

  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end

    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  scope module: :api, defaults: { format: 'json' } do
    namespace :v1 do
      resources :hs_sessions, only: :create
    end
  end

  resources :hs_sessions, only: :create
  devise_for :users
  root "home#index"
end
