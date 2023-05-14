class User < ApplicationRecord

	def find_test_by_level(level, user)
		Examination.where("user_id=?",user.id).find_each do |user_test|
			Test.where("level=? AND id=?" ,level.to_i, user_test.test_id).find_each do |test|
				puts test.title
			end
		end
	end  
end
