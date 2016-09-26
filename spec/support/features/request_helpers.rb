module Features
  module RequestHelpers
    def json
      ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(response.body))
    end

    def present(obj, with:, type:)
      JSON.parse(with.new(obj).as_json(type: type).to_json)
    end
  end
end