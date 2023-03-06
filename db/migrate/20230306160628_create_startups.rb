class CreateStartups < ActiveRecord::Migration[7.0]
  def change
    create_table :startups do |t|
      t.string :funding
      t.integer :team
      t.date :funding_round_end_date
      t.float :funding_amount
      t.string :industry
      t.integer :headcount
      t.integer :turnover
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
