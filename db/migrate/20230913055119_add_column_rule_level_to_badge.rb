class AddColumnRuleLevelToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_level, :integer
  end
end
