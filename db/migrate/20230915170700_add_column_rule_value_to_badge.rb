class AddColumnRuleValueToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_value, :string
  end
end
