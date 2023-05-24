class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users

  validates :title, uniqueness: { scope: :level } 
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0} 
  validates :title, presence: true
  scope :tests_names, -> (category) { joins(:category).select_categories(category).order(id: :desc).pluck(:title)}
  scope :difficulty, -> (level) {  if level.include?'easy'  
                           where level: 0..1 
                          else
                          if level.include?'medium'
                            where level: 2..4
                          else
                          if level.include?'hard'
                            where level: 5..Float::INFINITY
                          end
                          end
                        end
                        }
  

  def self.select_categories(category)
    where(categories:{title: category})
  end
end
