PERCENT_CORRECT_QUESTIONS = 85

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true


  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    return errors.add(:base, :invalid, message: "You should give the answer") if answer_ids.nil?  

    if  correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end
 

  def success_rate
    self.correct_questions*100/test.questions.count
  end

  def success?
    self.success_rate > PERCENT_CORRECT_QUESTIONS
  end

  def question_number
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def questions_amount
    test.questions.length
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def before_validation_set_next_question
    self.current_question = next_question 
  end

  def correct_answer?(answer_ids)
     correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answer 
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_save_set_next_question  
    self.current_question = next_question 
  end
  
end
