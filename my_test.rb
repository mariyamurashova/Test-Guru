
category=Category.new(title: :English)
category.save
user=User.new(name: 'Ivanov', email: '123@com')
user.save
test=user.tests.new(title: 'New Question4', level: 2, category: category, author: user)
test.save!
question=test.questions.new(body:'Question?')
question.save!
answer=question.answers.new(body: 'First')
answer.save!
answer=question.answers.new(body: 'Second')
answer.save!

