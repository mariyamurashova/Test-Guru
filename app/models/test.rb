class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  def self.tests_names(category)
    #self.joins("INNER JOIN categories ON category_id=categories.id").where(categories:{title: category}).order(id: :desc).pluck(:title)
    self.joins(:category).where(categories:{title: category}).order(id: :desc).pluck(:title)
end
end
