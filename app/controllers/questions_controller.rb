class QuestionsController < ApplicationController
before_action :find_test, only: %i[index]
   rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

   def index

     result = ["#{params.inspect}"]
     @questions = Question.where(test_id: params[:test_id].to_s)
     render inline:
       '<p><%=@test.title%><br>
       <% @questions.each do |question| %>
       <%= question[:body]%><br>
       <%end %></p>'
   end

   def show
     test = Test.find(params[:test_id])
     question = test.questions.find(params[:id])
     result = ["#{params.inspect}"]
     render json: question.body
   end


 def new

 end

 def create
  question = Question.create(question_params)
  render plain: question.inspect
 end

 def destroy
 question = Question.find(params[:id])
 question.destroy
 render plain: "Вопрос удален"

 end


 private

 def find_test
   @test = Test.find(params[:test_id])
 end

 def question_params
   params.require(:question).permit(:body, :test_id)
 end

 def rescue_with_question_not_found
   render plain: 'Question was not found'
 end

end

