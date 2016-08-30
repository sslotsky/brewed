module V1
  class UserPresenter < Presenter
    def initialize(user)
      @user = user
    end

    def to_jbuilder(type)
      Jbuilder.new do |json|
        json.extract! @user, :id, :username, :created_at, :updated_at
      end
    end

    def as_json(**args)
      to_jbuilder(args[:type]).attributes!
    end
  end
end