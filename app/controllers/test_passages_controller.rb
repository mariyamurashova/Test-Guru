class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update gist]
  
  def show
  end

  def result
  end
    
  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
   new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call

    Admin::GistsController.new.create(@test_passage, result)

  if new_gist.success?
      flash_options = {notice: "#{t('.success')} #{view_context.link_to t('.link'), result.html_url}"}
    else
      flash_options = {alert: " #{t('.failure')}"}
    end

   redirect_to @test_passage,flash_options
  end

  private

  def save_gist
    #@gist = @test_passage.user.gists.new(:question_id=>@test_passage.current_question_id, :gist_url=>@result.html_url)
    #@gist.save!
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
