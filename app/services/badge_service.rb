class BadgeService

  def initialize(test_passage, user)
    @test_passage = test_passage 
    @user = user
   end

  def get_badge
    Badge.all.each do |badge|
      @user.badges << badge if send("#{badge.rule}_aword?", badge.rule_value)
    end
  end

  def first_attempt_aword?
    TestPassage.where(user_id: @user.id, test_id: @test_passage.test_id).count == 1
  end

  def category_aword?(category)
   tests_pass_success.joins("INNER JOIN tests ON tests.id = test_id INNER JOIN categories ON tests.category_id = categories.id AND categories.title = '#{category}' ").count == Test.join_category(category).count 
  end

  def level_aword?(level)
    tests_pass_success.joins(:test).where(tests: {level:level}).count == Test.count_tests_with_level(@test_passage.test.level).count  
  end

  def tests_pass_success
    TestPassage.with_result_success.where(user_id: @user.id)
  end

end
