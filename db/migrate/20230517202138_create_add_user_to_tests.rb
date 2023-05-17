class CreateAddUserToTests < ActiveRecord::Migration[6.1]
  def change
    create_table :add_user_to_tests do |t|
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
