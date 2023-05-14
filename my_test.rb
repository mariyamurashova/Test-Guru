 puts "Введите уровень сложности теста от 1 до 3"
 level = gets.chomp.to_i
 User.find_each do |user| 
puts "#{user.name} прошел тесты:"
 puts user.find_test_by_level(level, user)

 category=Category.where(title: :English)
 Test.tests_names(category[0])
 end
