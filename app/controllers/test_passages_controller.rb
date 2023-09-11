class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show
  end

  def result
  end
    
  def update
 
    flash.delete(:notice)
    @test_passage.accept!(params[:answer_ids])
    show_errors
  
    if @test_passage.completed? 
       pass_success_first_attempt
       pass_success_Backend_tests
       pass_success_tests_level
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def add_badge(title)
    current_user.badges << Badge.where(title: title)
    flash[:notice] = " #{t('.get_aword')} #{view_context.link_to(t('.look_awords'), badges_path)}.".html_safe
  end   


  def pass_success_first_attempt
    add_badge("FirstAttemp") if current_user.tests.where(id: {id: @test_passage.test_id}).count == 0 && @test_passage.result_success == true
  end

  def pass_success_Backend_tests
    add_badge("BackendCategory") if current_user.tests.joins(:category).where(categories: {title: "Category1"}).where(test_passages: {result_success: true}).count >= Test.join_category("Category1").count 
  end

  def pass_success_tests_level
    add_badge("TestsWithLevel1") if current_user.tests.where(level: 1).where(test_passages: {result_success: true}).count  >= Test.count_tests_with_level(@test_passage.test.level) 
    add_badge("TestsWithLevel2") if current_user.tests.where(level: 2).where(test_passages: {result_success: true}).count  >= Test.count_tests_with_level(@test_passage.test.level)
    add_badge("TestsWithLevel3") if current_user.tests.where(level: 3).where(test_passages: {result_success: true}).count  >= Test.count_tests_with_level(@test_passage.test.level)
  end
  
  def show_errors
    if @test_passage.errors.any?
      flash[:notice] = @test_passage.errors.full_messages[0]
    end
  end

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def test_passage_params
     params.require(:test_passage).permit(:result_success)
  end

end
