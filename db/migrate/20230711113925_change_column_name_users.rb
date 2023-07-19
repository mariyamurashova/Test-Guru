class ChangeColumnNameUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :name, :string, null: true
    rename_column :users, :name, :first_name
  end
end
