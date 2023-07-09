class AddIndexToUsersEmail < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, name: "index_users_on_email", unique: true
  end
end
