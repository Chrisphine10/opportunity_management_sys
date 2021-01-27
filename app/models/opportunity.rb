class Opportunity < ApplicationRecord
  belongs_to :account
  validates :amount, :stage, presence: true
  enum stage: {
    "Discovery" => 0,
    "Proposal Shared" => 1,
    "Negotiation" => 2
  }
end
