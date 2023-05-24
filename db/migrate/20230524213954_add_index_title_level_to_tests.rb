class AddIndexTitleLevelToTests < ActiveRecord::Migration[6.1]
  def change
    #add_column :tests, :, :string
    add_index :tests, [:title,:level], unique: true, name: 'index_title_level'
  end
end
