class Admin::GistsController < Admin::BaseController

  def create(test_passage, result)
    @gist = test_passage.user.gists.new(:question_id=>test_passage.current_question_id, :gist_url=>result.html_url)
    @gist.save!
  end

  def show
    @gists = Gist.all
  end

end
