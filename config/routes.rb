require 'api_constraints'

Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      post :sign_in
      delete :sign_out
    end
  end
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :employees
    end
  end
end
