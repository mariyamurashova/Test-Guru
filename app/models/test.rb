class Test < ApplicationRecord
  belongs_to :category
  
  def self.tests_names(category)
    self.order(id: :desc).where(category_id: category.id).find_each do |test|
      puts "#{test.id} - #{test.title}"
    end
  end
end
