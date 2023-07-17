class QuestionsController < ApplicationController

  before_action :find_test, only: [:index, :create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions  
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  end
