class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found_exception

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
end
