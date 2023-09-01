class AddRedyForPublicationToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :redy_for_publication, :boolean, :default => false
  end
end
