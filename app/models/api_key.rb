class ApiKey < ApplicationRecord
  require 'securerandom'

  validates :api_key, :app_name, { uniqueness: true, presence: true }

  default_scope { where(active: true) }

  before_validation :generate_api_key

  # FIXME: This before_create callback is only necessary to make the tests pass.
  before_create :generate_api_key
  
  private

  def generate_api_key
    self.api_key ||= SecureRandom.hex
  end
end
