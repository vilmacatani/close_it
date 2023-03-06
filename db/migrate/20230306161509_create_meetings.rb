class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.datetime :meeting_time
      t.integer :duration
      t.boolean :meeting_accepted
      t.boolean :meeting_pending
      t.references :connection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
