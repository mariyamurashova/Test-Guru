class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show
  end

  def result
    if @test_passage.result_success?
      @badge_servise=BadgeService.new(@test_passage)
      @badge_servise.get_badge
    render :result
  end
    
  def update
    flash.delete(:notice)
    @test_passage.accept!(params[:answer_ids])
    show_errors
    if @test_passage.completed? 
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def show_errors
    if @test_passage.errors.any?
      flash[:notice] = @test_passage.errors.full_messages[0]
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
