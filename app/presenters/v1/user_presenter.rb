class V1::UserPresenter < Presenter
  attribute :id, Integer
  attribute :username, String

  def initialize(user)
    super(user)
  end
end