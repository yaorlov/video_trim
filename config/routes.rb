# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :users do
        resource :registration, only: :create
        resource :session, only: :create
        resource :video, only: :create
      end
    end
  end
end
