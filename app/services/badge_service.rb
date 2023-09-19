class BadgeService

  def initialize(test_passage)
    @test_passage = test_passage 
    @user = test_passage.user
    @user_badges = @user.badges
   end

  def call_badge
    Badge.all.each do |badge|
      if (send("#{badge.rule}_aword?", badge) && !recieved_earlier?(badge))
        @user.badges << badge if send("#{badge.rule}_aword?", badge.rule_value)
      end
    end
  end

  def add_new_badge?
    @user_badges.count > @user.badges.count
  end


  def first_attempt_aword?(_badge)
   TestPassage.with_result_success.where(user_id: @user.id, test_id: @test_passage.test_id).count == 1 
  end

  def category_aword?(rule_value)
    tests_with_category = Test.join_category(rule_value).pluck(:id)
    tests_pass_success(tests_with_category) == tests_with_category.count  
  end

  def level_aword?(rule_value)
    tests_with_level = Test.tests_with_level(rule_value).pluck(:id)
    tests_pass_success(tests_with_level) == tests_with_level.count  
  end

  def recieved_earlier?(badge)
    @user.badges.include?(badge) && badge.rule != "first_attempt"
  end

  def tests_pass_success(tests_ids)
    TestPassage.with_result_success.where(user_id: @user.id, test_id: tests_ids).pluck(:test_id).uniq.count
  end

end
