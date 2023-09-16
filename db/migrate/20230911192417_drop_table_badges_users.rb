class DropTableBadgesUsers < ActiveRecord::Migration[6.1]
  def up
    #drop_table :badges_users, if_exists: true
  end

  def down
    create_join_table :badges, :users do |t|
      t.index [:badge_id, :user_id]
      t.index [:user_id, :badge_id]
    end
  end
end
