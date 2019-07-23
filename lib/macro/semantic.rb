# frozen_string_literal: true

module Macro
  # rubocop:disable Naming/MethodName
  def self.Semantic(success: nil, failure: nil, **)
    task = lambda { |(ctx, flow_options), **|
      ctx[:success_semantic] = success
      ctx[:failure_semantic] = failure

      [Trailblazer::Activity::Right, [ctx, flow_options]]
    }

    { task: task, name: "semantic:#{success || failure}" }
  end
  # rubocop:enable Naming/MethodName
end
