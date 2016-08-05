class ApiToken < ApplicationRecord
  require 'securerandom'
  
  belongs_to :user

  validates :auth_token, :refresh_token, { uniqueness: true, presence: true }
  validates :user_agent, :user, presence: true

  default_scope { where('expires_at > ?', Time.now) }

  scope :expired, -> { where('expires_at <= ?', Time.now) }

  before_validation :generate_auth_token,
    :generate_refresh_token,
    :set_expiration_date

  # FIXME: This before_create callback is only necessary to make the tests pass.
  before_create :generate_auth_token,
    :generate_refresh_token,
    :set_expiration_date
    
  def refresh!
    self.auth_token = nil
    self.expires_at = nil
    save!
  end

  def expired?
    expires_at <= Time.now
  end

  private

  def generate_auth_token
    self.auth_token ||= SecureRandom.hex
  end

  def generate_refresh_token
    self.refresh_token ||= SecureRandom.hex
  end

  def set_expiration_date
    self.expires_at ||= Time.now + 1.hour
  end
end
