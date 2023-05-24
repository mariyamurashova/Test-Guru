category=Category.first
user=User.first
test=user.tests.new(title: 'New Question', level: 1, category: category, author: user)
test.save!
question=test.questions.new(body:'Question?')
question.save!
answer=question.answers.new(body: 'First')
answer.save!
answer=question.answers.new(body: 'Second')
answer.save!
