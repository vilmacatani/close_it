class AdddCollumnToStartupImg < ActiveRecord::Migration[7.0]
  def change
    add_column :startups, :img, :string
  end
end
