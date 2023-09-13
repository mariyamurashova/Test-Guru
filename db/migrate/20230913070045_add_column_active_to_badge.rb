class AddColumnActiveToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :active, :boolean, default: false
  end
end
