class CreateExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :examinations do |t|
      t.references :test
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
