class V1::SearchResultsPresenter
  def self.[](result_presenter_type)
    @@result_presenter_type = result_presenter_type
    self
  end

  attr_accessor :total_count, :results

  def initialize(search)
    self.total_count = search[:total_count]
    self.results = search[:results]
  end

  def as_json
    {
      total_count: self.total_count,
      results: self.results.map { |result| @@result_presenter_type.new(result).as_json }
    }
  end
end