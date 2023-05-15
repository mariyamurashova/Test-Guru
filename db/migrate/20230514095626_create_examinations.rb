class CreateExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :examinations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
