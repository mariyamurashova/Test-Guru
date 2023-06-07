module QuestionsHelper
  
  def question_header
    
   if @question.new_record?
      "Create New Question for Test - #{@test.title}"
    else
      test = Test.find(@question.test_id)
      "Edit #{test.title} Question"
    end
  end

  def curent_year
    time = Time.new
    "#{time.year} г."
  end

  def github_url(author, repo)
   link_to("Тест-Гуру", "https://github.com/#{author}/#{repo}")
  end
  

  def link_back
    if @question.persisted?
      link_to("Back", "/tests/#{@question[:test_id]}/questions")
    else
      link_to("Back", test_questions_path)
    end
  end
end
