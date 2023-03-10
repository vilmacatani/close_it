class AddBioColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :startups, :bio, :text
  end
end
