# frozen_string_literal: true

module ApiDoc
  module V1
    module Users
      module Request
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Requests' do
            endpoint 'api/v1/users/requests'
            group 'Requests'
          end

          group 'Requests' do
            desc 'Requests group'
          end
        end

        document :index do
          action 'Returns a list of user\'s requests'
        end

        document :restart do
          action 'Returns restarted request data'
        end
      end
    end
  end
end
