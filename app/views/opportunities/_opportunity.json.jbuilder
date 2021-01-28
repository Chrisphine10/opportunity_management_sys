json.extract! opportunity, :id, :name, :amount, :stage, :account_id, :created_at, :updated_at
json.url opportunity_url(opportunity, format: :json)
