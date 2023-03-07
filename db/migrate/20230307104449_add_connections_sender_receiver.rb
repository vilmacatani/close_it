class AddConnectionsSenderReceiver < ActiveRecord::Migration[7.0]
  def change
    add_reference :connections, :sender, foreign_key: { to_table: :users }
    add_reference :connections, :receiver, foreign_key: { to_table: :users }
  end
end
