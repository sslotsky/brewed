module V1
  class SearchResultsPresenter
    def initialize(search)
      @search = search
    end

    def as_json(**args)
      {
        total_count: @search[:total],
        results: @search[:results].map { |result| args[:with].new(result).as_json(type: args[:type]) }
      }
    end
  end
end
