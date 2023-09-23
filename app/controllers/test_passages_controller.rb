class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show
  end

  def result
    if @test_passage.result_success?
      @badge_servise=BadgeService.new(@test_passage)
     @badge_servise.call_badge
      if @badge_servise.add_new_badge? 
        flash[:notice] = "You got new badge. You can view it #{view_context.link_to('here', badges_path)}".html_safe
     end
    end
  end
    
  def update
    flash.delete(:notice)
    @test_passage.accept!(params[:answer_ids])
    show_errors
    if @test_passage.completed? || has_time_to_continue?
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


  def has_time_to_continue?
    Time.now >=(@test_passage.created_at+@test_passage.test.time_limit*60)
  end

  

end
