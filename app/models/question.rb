class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  has_many :current_questions, class_name: 'TestPassage'
  validates :body, presence: true
  
end
