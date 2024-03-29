class Test < ApplicationRecord
  
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :author_id
  has_many :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy  
  has_many :users, through: :test_passages

  validates :title, uniqueness: { scope: :level } 
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
  validates :title, presence: true

  scope :join_category, -> (category) { joins(:category).where(categories: {title: category})}
  scope :tests_with_level, -> (level) { where(level: level)}
  scope :published, -> { where(redy_for_publication: true) }
 
  scope :easy, -> { where(level: 0..1) }
  scope :mmiddle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  
  

  def self.select_categories(category)
    self.join_category(category).order(id: :desc).pluck(:title)
  end
end
