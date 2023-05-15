class User < ApplicationRecord

	def find_test_by_level(level, user)
	 result=Test.joins("INNER JOIN examinations ON tests.id=test_id").joins("INNER JOIN users ON users.id=user_id").where(tests: {level:  level}, users: {id: user.id}).pluck
    result=result[0]
    puts result[1]
	end
end
