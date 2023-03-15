class Addcolumnstartups < ActiveRecord::Migration[7.0]
  def change
    add_column :startups, :raised_amount, :float
  end
end
