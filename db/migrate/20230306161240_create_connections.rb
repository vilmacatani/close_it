class CreateConnections < ActiveRecord::Migration[7.0]
  def change
    create_table :connections do |t|
      t.string :connection_type
      t.boolean :pending
      t.boolean :accepted
      t.text :message

      t.timestamps
    end
  end
end
