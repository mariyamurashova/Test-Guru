class TestsController < ApplicationController

  before_action :authenticate_user!, only: %i[ start ]
  before_action :set_test, only: %i[ start ]

  def index
    @tests = Test.all  
  end

  def start
    if @test.questions.presence
      current_user.tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      redirect_to root_path, notice: "Test hasn't questions at the moment"
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
