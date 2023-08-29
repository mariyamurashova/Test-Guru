# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
categories = Category.create([{title: :Category1}, {title: :Category2}, {title: :Category3}])
users = User.create([{ first_name: 'Иван', 
                       last_name: 'Иванов', 
                       email: 'ivan@example.ru',
                       password: '123456',
                        password_confirmation: '123456'}, 

                       { first_name: 'Петр', 
                        last_name:'Петров', 
                        email: 'admin@example.ru',
                        password: '123456',
                        password_confirmation: '123456'
                        type: 'Admin' }])

tests = Test.create([{title:'Test1', level: 1, category_id: categories[0].id, author_id: users[1].id},
                     {title: 'Test2', level: 2, category_id: categories[0].id, author_id: users[1].id},
                     {title: 'Test3', level: 1, category_id: categories[1].id, author_id: users[1].id}, 
                     {title: 'Test4', level: 2, category_id: categories[1].id, author_id: users[1].id},
                     {title: 'Test5', level: 1, category_id: categories[2].id, author_id: users[1].id}, 
                     {title: 'Test6', level: 3, category_id: categories[2].id, author_id: users[1].id}])

questions = Question.create([{body: 'Test1 Question1', test_id: tests[0].id},
                             {body: 'Test1 Question2', test_id: tests[0].id},
                             {body: 'Test1 Question3', test_id: tests[0].id},
                             {body: 'Test2 Question1', test_id: tests[1].id},
                             {body: 'Test2 Question2', test_id: tests[1].id},
                             {body: 'Test2 Question3', test_id: tests[1].id},
                             {body: 'Test3 Question1', test_id: tests[2].id},
                             {body: 'Test3 Question2', test_id: tests[2].id},
                             {body: 'Test3 Question3', test_id: tests[2].id},
                             {body: 'Test4 Question1', test_id: tests[3].id},
                             {body: 'Test4 Question2', test_id: tests[3].id},
                             {body: 'Test5 Question1', test_id: tests[4].id},
                             {body: 'Test5 Question2', test_id: tests[4].id},
                             {body: 'Test6 Question1', test_id: tests[5].id},
                             {body: 'Test6 Question2', test_id: tests[5].id},
                            ])

answers = Answer.create([{body: '1. "Answer1 Question1"', question_id: questions[0].id},
                         {body: '2. "Answer2 Question1"', question_id: questions[0].id},
                         {body: '3. "Answer3 Question1"', correct: true, question_id:questions[0].id},#
                         {body: '1. "Answer1 Question2"', question_id: questions[1].id},
                         {body: '2. "Answer2 Question2"', correct: true, question_id: questions[1].id},
                         {body: '3. "Answer3 Question2"', question_id: questions[1].id},
                         {body: '1. "Answer1 Question3"', correct: true, question_id: questions[2].id},
                         {body: '2. "Answer2 Question3"',  question_id: questions[2].id},
                         {body: '3. "Answer3 Question3"', question_id: questions[2].id},
                         {body: '1. "Answer1 Question4"', correct: true, question_id: questions[3].id},
                         {body: '2. "Answer2 Question4"',  question_id: questions[3].id},
                         {body: '1. "Answer1 Question5"', question_id: questions[4].id},
                         {body: '2. "Answer2 Question5"', correct: true, question_id: questions[4].id},
                         {body: '1. "Answer1 Question6"', question_id: questions[5].id},
                         {body: '2. "Answer2 Question6"', correct: true, question_id: questions[5].id},
                         {body: '1. "Answer1 Question7"', correct: true, question_id: questions[6].id},
                         {body: '2. "Answer2 Question7"', question_id: questions[6].id},
                         {body: '1. "Answer1 Question8"', correct: true, question_id: questions[7].id},
                         {body: '2. "Answer2 Question8"', question_id: questions[7].id},
                         {body: '1. "Answer1 Question9"', question_id: questions[8].id},
                         {body: '2. "Answer2 Question9"', question_id: questions[8].id},
                         {body: '3. "Answer3 Question9"', correct: true, question_id: questions[8].id},
                         {body: '1. "Answer1 Question10"', question_id: questions[9].id},
                         {body: '2. "Answer2 Question10"', correct: true, question_id: questions[9].id},
                         {body: '1. "Answer1 Question11"', correct: true, question_id: questions[10].id},
                         {body: '2. "Answer2 Question11"',  question_id: questions[10].id},
                         {body: '1. "Answer1 Question12"', question_id: questions[11].id},
                         {body: '2. "Answer2 Question12"', correct: true, question_id: questions[11].id},
                         {body: '1. "Answer1 Question13"', question_id: questions[12].id},
                         {body: '2. "Answer2 Question13"', correct: true, question_id: questions[12].id},
                         {body: '1. "Answer1 Question14"', question_id: questions[13].id},
                         {body: '2. "Answer2 Question14"', correct: true, question_id: questions[13].id}])








