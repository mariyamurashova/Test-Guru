class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable

  has_many :created_tests, class_name: "Test", foreign_key: :author_id
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, uniqueness: true, format:  {with: URI::MailTo::EMAIL_REGEXP}
  validates :first_name, :last_name, presence: true

  def find_test_by_level(level)
	 Test.joins(:tests_users).where(tests_users: {user_id: id}, level:  level).pluck(:title)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id) 
  end

  def admin?
    self.type == 'Admin'
  end

end
