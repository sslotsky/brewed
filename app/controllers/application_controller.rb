class ApplicationController < ActionController::API
  include Cerulean

  before_action :validate_api_key!

  rescue_from AuthenticationRequired do |e|
    render json: { status: 403, message: 'Authentication Required', code: :authentication_required }, status: 403
  end

  rescue_from ApiCredentialsInvalid do |e|
    render json: { status: 401, message: 'API Credentials Invalid', code: :api_credentials_invalid }, status: 401
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    errors = e.record.errors.messages.map { |field, messages| [field, messages.map{ |message| message.translation_metadata[:default].last.to_s.split('.').last }] }.to_h
    render json: { status: 422, message: 'Record Invalid', code: :record_invalid, errors: errors, status: 422 }
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { status: 404, message: 'Record Not Found', code: :record_not_found }, status: 404
  end

  def authenticate!
    raise AuthenticationRequired.new unless current_user
  end

  def current_user
    if request.headers.key?('X-Auth-Token')
      @current_user ||= ApiToken.find_by(auth_token: request.headers['X-Auth-Token']).try(:user)
    end
  end

  private

  def validate_api_key!
    raise ApiCredentialsInvalid.new unless ApiKey.find_by(api_key: request.headers['X-Api-Key'])
  end
end
