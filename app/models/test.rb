class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, uniqueness: { scope: :level } 
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
  validates :title, presence: true

  scope :join_category, -> (category) { joins(:category).where(categories: {title: category})}
 
  scope :easy, -> { where(level: 0..1) }
  scope :mmiddle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  

  def self.select_categories(category)
    self.join_category(category).order(id: :desc).pluck(:title)
  end
end
