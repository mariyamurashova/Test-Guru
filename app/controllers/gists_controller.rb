class GistsController < ApplicationController

  before_action :set_test_passage, only: %i[create]

  def create

    new_gist = GistQuestionService.new(@test_passage.current_question)
    result = new_gist.call
    
    if new_gist.success?
      flash_options = {notice: "#{t('.success')} #{view_context.link_to t('.link'), result.html_url}"}
    else
      flash_options = {alert: " #{t('.failure')}"}
    end

    @gist = @test_passage.user.gists.new(question_id: @test_passage.current_question_id, gist_url: result.html_url)
    @gist.save!

    redirect_to @test_passage,flash_options

  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end

