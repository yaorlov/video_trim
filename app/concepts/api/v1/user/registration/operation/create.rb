# frozen_string_literal: true

module Api::V1::User::Registration::Operation
  class Create < Trailblazer::Operation
    pass Macro::Semantic(success: :created)
    step Model(User, :new)
    step Contract::Build(constant: Api::V1::User::Registration::Contract::Create)
    step Contract::Validate(), fail_fast: true
    step Contract::Persist()
    step :renderer_options

    def renderer_options(ctx, **)
      ctx[:renderer_options] = {
        class: {
          User: Api::V1::User::Registration::Representer::Create
        }
      }
    end
  end
end
