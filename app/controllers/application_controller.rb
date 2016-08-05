class ApplicationController < ActionController::API
  include Tachyon

  before_action :validate_api_key!

  def authenticate!
    raise "Not authenticated!" unless current_user
  end

  def current_user
    if request.headers.key?('X-Auth-Token')
      @current_user ||= ApiToken.find_by(auth_token: request.headers['X-Auth-Token']).try(:user)
    end
  end

  private

  def validate_api_key!
    render nothing: true, status: :unauthorized unless ApiKey.find_by(api_key: request.headers['X-Api-Key'])
  end
end
