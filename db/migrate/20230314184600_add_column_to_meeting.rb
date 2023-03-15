class AddColumnToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :end_time, :datetime
  end
end
