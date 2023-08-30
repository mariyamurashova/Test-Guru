class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show result update]

  def show
  end

  def result
  end
    
  def update

    if params[:answer_ids]!=nil
      @test_passage.accept!(params[:answer_ids])
        if @test_passage.completed?
          TestsMailer.completed_test(@test_passage).deliver_now
          redirect_to result_test_passage_path(@test_passage)
        else
          render :show
        end
    else
      redirect_to test_passage_path, notice: t('.give_answer')
    end
 
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def get_answer?
    if params[:answer_ids]!=nil
    end
  end

end
