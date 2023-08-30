class Question < ApplicationRecord

  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :current_questions, class_name: 'TestPassage'
  has_many :gists
  validates :body, presence: true
  
end
