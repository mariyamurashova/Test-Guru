class AddColumnRuleCategoryToBadge < ActiveRecord::Migration[6.1]
  def change
    add_column :badges, :rule_category, :string
  end
end
