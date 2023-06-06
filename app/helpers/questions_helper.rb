module QuestionsHelper
  
  def question_header
    
    if params[:action] == "edit" 
      test = Test.find(@question.test_id)
      "Edit #{test.title} Question"
    else
      "Create New Question for Test - #{@test.title}"
    end
  end

  def curent_year
    time = Time.new
    "#{time.year} г."
  end

  def github_url(author, repo)
   "https://github.com/#{author}/#{repo}"
  end

  def link_back
   "/tests/#{@question[:test_id]}/questions"
  end
end
