# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        resource :registration, only: :create
        resource :session, only: :create
        resources :videos, only: %i[create index]
        resources :requests, only: :index do
          post 'restart', on: :member
        end
      end

      get '/docs', to: lambda { |_env|
        [200, {}, [File.open(Rails.root.join('public', 'api', 'docs', 'v1', 'index.html')).read]]
      }
    end
  end
end
