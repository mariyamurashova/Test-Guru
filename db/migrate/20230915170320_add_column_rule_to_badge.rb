class AddColumnRuleToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule, :string
  end
end
