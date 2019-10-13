# frozen_string_literal: true

module ApiDoc
  module V1
    module Users
      module Video
        extend ::Dox::DSL::Syntax

        document :api do
          resource 'Videos' do
            endpoint 'api/v1/users/videos'
            group 'Videos'
          end

          group 'Videos' do
            desc 'Videos group'
          end
        end

        document :create do
          action 'Create a new user video'
        end

        document :index do
          action 'Returns a list of user\'s trimmed videos'
        end
      end
    end
  end
end
