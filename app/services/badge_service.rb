class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage 
    @user = test_passage.user
   end

  def get_badge
    Badge.all.each do |badge|
      if (send("#{badge.rule}_aword?", badge) && !recieved_earlier?(badge))
        @user.badges << badge if send("#{badge.rule}_aword?", badge)
      end
    end
  end

  def first_attempt_aword?(badge)
   TestPassage.where(user_id: @user.id, test_id: @test_passage.test_id).count == 1 
  end

  def category_aword?(badge)
    ids=Test.join_category(badge.rule_value)
    tests_pass_success = TestPassage.with_result_success.where(test_id: ids).select(:test_id).uniq.count 
    tests_pass_success == Test.join_category(badge.rule_value).count   
  end

  def level_aword?(badge)
    tests_pass_success = TestPassage.with_result_success.where(user_id: @user.id).joins(:test).where(tests: {level:badge.rule_value}).select(:test_id).uniq.count
    tests_pass_success == Test.tests_with_level(badge.rule_value).count  
  end

  def recieved_earlier?(badge)
    @user.badges.include?(badge)
  end

end
