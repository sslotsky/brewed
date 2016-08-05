class Presenter
  include Virtus.model

  def initialize(model)
    super(model.attributes)
  end
end