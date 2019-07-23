# frozen_string_literal: true

module DefaultEndpoint
  protected

  # rubocop:disable Metrics/AbcSize
  def default_handler
    lambda do |match|
      match.created { |result| result[:renderer_options] ? render_response(result, :created) : head(:created) }
      match.destroyed { head(:no_content) }
      match.forbidden { head(:forbidden) }
      match.gone { head(:gone) }
      match.invalid { |result| render_errors(result, :unprocessable_entity) }
      match.no_content { head(:no_content) }
      match.unauthenticated { head(:unauthenticated) }
      match.success { |result| render_response(result, :ok) }
    end
  end
  # rubocop:enable Metrics/AbcSize

  def endpoint(operation_class, options = {}, &block)
    Api::Endpoint.call(operation_class, default_handler, { **options, params: params.to_unsafe_hash }, &block)
  end

  private

  def render_errors(result, status)
    render jsonapi_errors: result['contract.default']&.errors || result[:errors],
           class: {
             'Reform::Contract::Errors': Lib::Representer::ReformErrorsSerializer,
             Hash: Lib::Representer::HashErrorsSerializer
           },
           status: status
  end

  def render_response(result, status)
    render jsonapi: result[:model], **result[:renderer_options], include: params[:include], status: status
  end
end
