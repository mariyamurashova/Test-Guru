class User < ApplicationRecord
  has_many :test_created, class_name: "Test"
  has_many :test_passages
  has_many :tests, through: :test_passages
  validates :name, :email, presence: true


  def find_test_by_level(level)
	 Test.joins(:tests_users).where(tests_users: {user_id: id}, level:  level).pluck(:title)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id) 
  end
end
