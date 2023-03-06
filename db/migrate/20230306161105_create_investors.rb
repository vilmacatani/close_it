class CreateInvestors < ActiveRecord::Migration[7.0]
  def change
    create_table :investors do |t|
      t.boolean :private
      t.string :funding_type
      t.string :investor_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
