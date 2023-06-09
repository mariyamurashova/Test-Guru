class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:show, :destroy, :edit, :update]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
    
   end

   def show
   
   end

  def new
    @question = @test.questions.new 
  end

  def edit
    
  end

  def update
      if @question.update(question_params)
        redirect_to @question
      else
        render :edit
      end
  end

  def create
    @question = @test.questions.new(question_params)
      if @question.save
        redirect_to test_questions_path
      else
        render :new
      end
  end

  def destroy
    @question.destroy
     redirect_to test_questions_path(@question.test)
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

=======
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


