class Opportunity < ApplicationRecord
  belongs_to :account
  validates :name, :amount, :stage, presence: true

  enum stage: {
    "Discovery" => 0,
    "Proposal Shared" => 1,
    "Negotiation" => 2
  }
  validates :stage, inclusion: stages.keys
  validates :amount, numericality: { greater_than_or_equal_to: 0.01 }
end
