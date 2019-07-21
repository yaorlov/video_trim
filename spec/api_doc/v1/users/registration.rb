# frozen_string_literal: true

module ApiDoc
  module V1
    module Users
      module Registration
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Users' do
            endpoint 'api/v1/users/registration'
            group 'Users'
          end

          group 'Users' do
            desc 'Users group'
          end
        end

        document :create do
          action 'Create a new user'
        end
      end
    end
  end
end
