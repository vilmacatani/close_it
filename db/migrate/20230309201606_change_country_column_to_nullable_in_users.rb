class ChangeCountryColumnToNullableInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :country, true
  end
end
