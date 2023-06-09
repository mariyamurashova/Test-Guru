class TestsController < ApplicationController

  before_action :authenticate_user!, only: %i[show edit update destroy start ]
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all  
  end

  def show
   redirect_to test_questions_path(@test)
  end

  def new
    @test = Test.new
  end

  def edit
   
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit 
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
     params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
  

end
