class User < ApplicationRecord
  require 'bcrypt'

  has_many :recipes, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :hash_password
  
  def self.search(page: 1, results_per_page: 10, sort: :id, sort_reverse: false)
    {
      total: self.count,
      results: self.order({sort.to_sym => (sort_reverse ? :desc : :asc)}).limit(results_per_page.to_i).offset((page.to_i - 1) * results_per_page.to_i).all
    }
  end
  
  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end

  def authenticate(password)
    BCrypt::Password.new(self.password) == password
  end
end
