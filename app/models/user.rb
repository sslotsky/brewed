class User < ApplicationRecord
  require 'bcrypt'

  has_many :recipes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :hash_password
  
  def self.search(limit:, offset:)
    {
      total_count: self.count,
      results: self.limit(limit).offset(offset)
    }
  end
  
  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end
