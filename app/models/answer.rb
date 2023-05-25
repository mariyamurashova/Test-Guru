class Answer < ApplicationRecord
  belongs_to :question
  validates :body, presence: true
  validate :answers_amount 
  scope :just_correct, -> {where correct: true}

def answers_amount 
  errors.add(:base, :invalid, message: "More than 4 answers") if (questions.where(question_id: self.question_id)).length > 4
end
end
