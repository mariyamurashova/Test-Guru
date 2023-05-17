class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  def self.tests_names(category)
    self.order(id: :desc).where(category: category).pluck(:title)
  end
end
