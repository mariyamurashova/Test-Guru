class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline:
       '<p><%=@test.title%><br>
       <% @test.questions.each do |question| %>
       <%= question[:body]%><br>
       <%end %></p>'
   end

   def show
    render json: @question.body
   end

  def new

  end

  def create
    @question_new = @test.questions.new(question_params)
      if @question_new.save
        render plain: "question is saved"
      else
        render plain: "question isn'n saved"
      end
  end

  def destroy
    @question.destroy
    render plain: "Вопрос удален"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  end


