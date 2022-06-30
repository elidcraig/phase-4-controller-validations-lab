class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid

  private

  def handle_invalid e
    render json: { errors: e.record.messages }, status: :unprocessable_entity
  end
end
