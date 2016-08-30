module V1
  class ApiTokenPresenter
    def initialize(api_token)
      @api_token = api_token
    end
    
    def to_jbuilder
      Jbuilder.new do |json|
        json.extract! @api_token, :id, :auth_token, :refresh_token,
          :created_at, :updated_at

        json.user UserPresenter.single(@api_token.user, type: :detail)
      end
    end

    def as_json(**args)
      to_jbuilder.attributes!
    end
  end
end