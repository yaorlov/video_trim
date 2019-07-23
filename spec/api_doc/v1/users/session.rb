# frozen_string_literal: true

module ApiDoc
  module V1
    module Users
      module Session
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Users' do
            endpoint 'api/v1/users/session'
            group 'Users'
          end

          group 'Users' do
            desc 'Users group'
          end
        end

        document :create do
          action 'Create a new user session'
        end
      end
    end
  end
end
