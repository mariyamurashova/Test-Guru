class User < ApplicationRecord
	has_many :examinations
	has_many :tests
	has_many :tests_users
	has_many :tests, through: :tests_users

	def find_test_by_level(level)
		Test.joins("INNER JOIN tests_users ON tests.id = tests_users.test_id").where(tests_users: {user_id: id}, level:  level,).pluck(:title)
	end
end
