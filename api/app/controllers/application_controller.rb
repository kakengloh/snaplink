class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_exception
  rescue_from ActionController::ParameterMissing, with: :handle_parameter_exception

  private

  def handle_not_found_exception
    render(
      json: {
        error: {
          code: 'NOT_FOUND',
          message: 'The requested resource was not found.'
        }
      },
      status: :not_found
    )
  end

  def handle_parameter_exception(e)
    render(
      json: {
        error: {
          code: 'INVALID_PARAMETER',
          message: e.message
        }
      },
      status: :bad_request
    )
  end
end
