module QuestionsHelper
  
  def question_header(question)
    
   if question.new_record?
      "Create New Question for Test - #{question.test.title}"
    else
      "Edit #{question.test.title} Question"
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
      link_to("Back", test_questions_path(@question.test))
  end
end
