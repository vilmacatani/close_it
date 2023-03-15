class FixColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :meetings, :meeting_time, :start_time
  end
end
