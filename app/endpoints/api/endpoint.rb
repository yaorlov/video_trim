# frozen_string_literal: true

module Api
  class Endpoint < Trailblazer::Endpoint
    Matcher = Dry::Matcher.new(
      created: Dry::Matcher::Case.new(
        match: lambda { |result|
          result.success? && (result['model.action'] == :new || result[:success_semantic] == :created)
        },
        resolve: ->(result) { result }
      ),
      destroyed: Dry::Matcher::Case.new(
        match: lambda { |result|
          result.success? && result[:model].try(:destroyed?)
        },
        resolve: ->(result) { result }
      ),
      forbidden: Dry::Matcher::Case.new(
        match: lambda { |result|
          result.failure? && result['result.policy.default']&.failure?
        },
        resolve: ->(result) { result }
      ),
      gone: Dry::Matcher::Case.new(
        match: lambda { |result|
          result.failure? && result[:failure_semantic] == :gone
        },
        resolve: ->(result) { result }
      ),
      invalid: Dry::Matcher::Case.new(
        match: lambda { |result|
          result.failure? &&
            (result['result.contract.default']&.failure? || result['result.contract.default'].present?) ||
            result[:errors].present?
        },
        resolve: ->(result) { result }
      ),
      no_content: Dry::Matcher::Case.new(
        match: ->(result) { result.success? && result[:renderer_options].nil? },
        resolve: ->(result) { result }
      ),
      unauthenticated: Dry::Matcher::Case.new(
        match: lambda { |result|
          result[:failure_semantic] == :unauthenticated
        },
        resolve: ->(result) { result }
      ),
      success: Dry::Matcher::Case.new(
        match: ->(result) { result.success? },
        resolve: ->(result) { result }
      )
    )

    def matcher
      ::Api::Endpoint::Matcher
    end
  end
end
