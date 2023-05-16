class Test < ApplicationRecord
  belongs_to :category
  
  def self.tests_names(category)
    self.order(id: :desc).where(category: category).pluck(:title)
  end
end
