class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :answers_amount 
  scope :correct_answer, -> {where correct: true}

def answers_amount 
  errors.add(:base, :invalid, message: "More than 4 answers") if question.answers.length > 4
end
end
