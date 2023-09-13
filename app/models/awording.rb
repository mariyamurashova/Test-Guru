class Awording < ApplicationRecord
  belongs_to :user
  belongs_to :badge


  def get_badge?(test_passage)
    set_active_category_level_first_attemp_badges
    pass_success_first_attempt(test_passage) if @first_attempt_badge.present?
    pass_success_tests_category(@category) if @category.present?  
    pass_success_tests_level(@level,test_passage) if @category.present?
  end

  def pass_success_first_attempt(test_passage)
    add_badge_to_user(@first_attempt_badge) if self.user.tests.where(id: test_passage.test_id).count == 1
  end

  def pass_success_tests_category(category)
    category.each do |category|
      if self.user.tests.joins(:category).where(categories: {title: category}).where(test_passages: {result_success: true}).count == Test.join_category(category).count
        add_badge_to_user(Badge.where(rule_category: category))
      end
    end 
  end

  def pass_success_tests_level(level, test_passage)
    level.each do |level|
      if self.user.tests.where(level: level).where(test_passages: {result_success: true}).count  == Test.count_tests_with_level(test_passage.test.level).count
        add_badge_to_user(Badge.where(rule_level: level))
      end
    end
  end

  def set_active_category_level_first_attemp_badges
    @category = Badge.category_rules.active_rules.pluck(:rule_category)
    @level = Badge.level_rules.active_rules.pluck(:rule_level)
    @first_attempt_badge = Badge.active_rules.where(rule_category: nil ).where(rule_level: nil)
  end

  def add_badge_to_user(badge)
    self.user.badges.push(badge)
  end

end
