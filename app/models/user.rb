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
      results: self.limit(results_per_page.to_i).offset((page.to_i - 1) * results_per_page.to_i).all
    }
  end
  
  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end
