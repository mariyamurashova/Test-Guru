# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
categories = Category.create([{title: :Russian}, {title: :English}, {title: :Francaise}])
tests = Test.create([{title:'Русский алфавит', level: 1, category_id: categories[0].id}, 
                    {title: 'Безударные гласные', level: 2, category_id: categories[0].id},
                    {title: 'English Alphabeth', level: 1, category_id: categories[1].id}, 
                    {title: 'Translate Word', level: 2, category_id: categories[1].id},
                    {title: 'Irregular verbs', level: 3, category_id: categories[1].id},
                    {title: 'Déclinaison du verbe être', level: 3, category_id: categories[2].id}])

questions = Question.create([{body: 'Вставь пропущенную букву а, б, в ..,д', test_id: tests[0].id},
                            {body: 'Вставь пропущенную букву л, к, м ..,о', test_id: tests[0].id},
                            {body: 'Вставь пропущенную букву с, т, у  ..,х', test_id: tests[0].id},
                            {body: 'Вставь пропущенную букву в слове Л..СНИК', test_id: tests[1].id},
                            {body: 'Вставь пропущенную букву в слове З..МЛЯ', test_id: tests[1].id},
                            {body: 'Вставь пропущенную букву в слове Х..ЛОДНЫЙ', test_id: tests[1].id},
                            {body: 'Вставь пропущенную букву e, f,..h', test_id: tests[2].id},
                             {body: 'Вставь пропущенную букву o, p,..r', test_id: tests[2].id},
                            {body: 'Как переводится слово "LANGUAGE"', test_id: tests[3].id},
                            {body: 'Как переводится слово "ANIMAL"', test_id: tests[3].id},
                            {body: 'Выбери правильную форму глагола to be во 2-ой форме прошедшего времени', test_id: tests[4].id},
                             {body: 'Выбери правильную форму глагола to  go во 2-ой форме прошедшего времени', test_id: tests[4].id},
                              {body: 'Выбери правильную форму глагола être с местоимением elle ', test_id: tests[5].id},
                              {body: 'Выбери правильную форму глагола être с местоимением nous ', test_id: tests[5].id},
                            ])

answers = Answer.create([{body: '1. "е"', question_id: questions[0].id},
                        {body: '2. "р"', question_id: questions[0].id},
                        {body: '3. "г"', correct: true, question_id:questions[0].id},
                        {body: '1. "з"', question_id: questions[1].id},
                        {body: '2. "н"', correct: true, question_id: questions[1].id},
                        {body: '3. "c"', question_id: tests[1].id},
                        {body: '1. "ф"', correct: true, question_id: questions[2].id},
                        {body: '2. "н"',  question_id: questions[2].id},
                        {body: '3. "c"', question_id: questions[2].id},
                        {body: '1. "Е"', correct: true, question_id: questions[3].id},
                        {body: '2. "И"',  question_id: questions[3].id},
                        {body: '1. "И"', question_id: questions[4].id},
                        {body: '2. "Е"', correct: true, question_id: questions[4].id},
                        {body: '1. "А"', question_id: questions[5].id},
                        {body: '2. "О"', correct: true, question_id: questions[5].id},
                        {body: '1. "g"', correct: true, question_id: questions[6].id},
                        {body: '2. "j"', question_id: questions[6].id},
                        {body: '1. "q"', correct: true, question_id: questions[7].id},
                        {body: '2. "s"', question_id: questions[7].id},
                        {body: '1. "ПРЕДЛОЖЕНИЕ"', question_id: questions[8].id},
                        {body: '2. "РАССКАЗ"', question_id: questions[8].id},
                        {body: '3. "ЯЗЫК"', correct: true, question_id: questions[8].id},
                        {body: '1. "АНОМАЛИЯ"', question_id: questions[9].id},
                        {body: '2. "ЖИВОТНОЕ"', correct: true, question_id: questions[9].id},
                        {body: '1. was/were', correct: true, question_id: questions[10].id},
                        {body: '2. been',  question_id: questions[10].id},
                         {body: '1. gone', question_id: questions[11].id},
                        {body: '2. went', correct: true, question_id: questions[11].id},
                        {body: '1. es', question_id: questions[12].id},
                        {body: '2. est', correct: true, question_id: questions[12].id},
                        {body: '1. sont', question_id: questions[13].id},
                        {body: '2. sommes', correct: true, question_id: questions[13].id}])

users = User.create([{name: 'Иван Иванов'}, {name: 'Петр Петров'}])


