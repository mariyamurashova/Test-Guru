require 'digest/sha1'

class User < ApplicationRecord

  EMAIL_REGEX = /[A-Za-z0-9][A-Za-z0-9\.-_]*[A-Za-z0-9]*@([A-Za-z0-9]+([A-Za-z0-9-]*[A-Za-z0-9]+)*\.)+[A-Za-z]*$\z/i

  has_many :test_created, class_name: "Test", foreign_key: :user_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  has_secure_password

  validates :email, uniqueness: true, format: { with: EMAIL_REGEX, message: "wrong email's format" }

  def find_test_by_level(level)
	 Test.joins(:tests_users).where(tests_users: {user_id: id}, level:  level).pluck(:title)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id) 
  end

end
