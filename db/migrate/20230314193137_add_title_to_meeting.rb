class AddTitleToMeeting < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :title, :string
  end
end
