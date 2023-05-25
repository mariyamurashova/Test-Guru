class User < ApplicationRecord
  has_many :test_created, class_name: "Test"
  has_many :tests_users
  has_many :tests, through: :tests_users
  validates :name, :email, presence: true


  def find_test_by_level(level)
	 Test.joins(:tests_users).where(tests_users: {user_id: id}, level:  level).pluck(:title)
  end
end
