# frozen_string_literal: true

module ApiDoc
  module V1
    module Users
      module Registration
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Registrations' do
            endpoint 'api/v1/users/registration'
            group 'Registrations'
          end

          group 'Registrations' do
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
