class Form
  extend ActiveModel::Naming
  include Virtus.model
  include ActiveModel::Conversion
  include ActiveModel::Validations
  include ActionView::Helpers::SanitizeHelper
end