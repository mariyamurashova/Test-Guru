class AddResultSuccessToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :result_success, :boolean
  end
end
