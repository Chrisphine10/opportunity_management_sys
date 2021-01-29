class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains
  has_many :accounts
  enum role: {
    "Admin" => 1,
    "User" => 2
  }
  validates :role, inclusion: roles.keys
  class Error < StandardError
  end
  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end
end
