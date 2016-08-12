class V1::DocsController < ActionController::Base
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Brewed'
      key :description, 'A homebrew beer recipe API.'
      key :termsOfService, 'https://example.com/terms/'
      contact do
        key :name, 'Brewed API Team'
      end
      license do
        key :name, 'MIT'
      end
    end
    tag do
      key :name, 'recipe'
      key :description, 'Recipe operations'
      externalDocs do
        key :description, 'Find more info here'
        key :url, 'https://example.com'
      end
    end
    key :host, 'brewed-dev.herokuapp.com'
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    V1::RecipesController,
    V1::RecipePresenter,
    self
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end