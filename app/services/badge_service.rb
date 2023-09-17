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
   TestPassage.with_result_success.where(user_id: @user.id, test_id: @test_passage.test_id).count == 1 
  end

  def category_aword?(badge)
   tests_pass_success(tests_with_category(badge.rule_value))  ==  tests_with_category(badge.rule_value).count  
  end

  def level_aword?(badge)
    tests_pass_success(tests_with_level(badge.rule_value.to_i)) == tests_with_level(badge.rule_value.to_i).count  
  end

  def recieved_earlier?(badge)
    @user.badges.include?(badge) && badge.rule != "first_attempt"
  end

  def tests_with_category(rule_value)
    Test.join_category(rule_value).pluck(:id)
  end

  def tests_with_level(rule_value)
    Test.tests_with_level(rule_value).pluck(:id)
  end

  def tests_pass_success(tests_ids)
    TestPassage.with_result_success.where(user_id: @user.id, test_id: tests_ids).pluck(:test_id).uniq.count
  end

end
