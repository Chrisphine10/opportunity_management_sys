class Account < ApplicationRecord
  validates :name, :address, presence: true
  validates :name, uniqueness: true
  has_many :opportunities, dependent: :destroy
  belongs_to :user

end