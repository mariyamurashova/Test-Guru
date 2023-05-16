class User < ApplicationRecord

	def find_test_by_level(level)
		Test.joins("INNER JOIN examinations ON tests.id = examinations.test_id").where(examinations: {user_id: id}, level:  level,).pluck(:title)
	end
end
