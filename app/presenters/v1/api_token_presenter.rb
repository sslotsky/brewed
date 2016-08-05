class V1::ApiTokenPresenter < Presenter
  attribute :id, Integer
  attribute :auth_token, String
  attribute :refresh_token, String

  def initialize(auth_token)
    super(auth_token)
  end
end