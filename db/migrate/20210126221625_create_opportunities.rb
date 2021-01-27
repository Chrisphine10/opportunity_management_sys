class CreateOpportunities < ActiveRecord::Migration[6.0]
  def change
    create_table :opportunities do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.string :stage
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
