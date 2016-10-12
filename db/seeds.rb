User.create! name:  "Cuc Le", email: "cuc@gmail.com", password: "123456",
  password_confirmation: "123456", is_admin: true

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@gmail.com"
  password = "123456"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end

5.times do
  title = Faker::Lorem.sentence(3)
  question_number = Random.rand(10) + 10
  Category.create!(title: title, question_number: question_number)
end

50.times do |question|
  name = "Question#{question + 1}"
  category_id = Random.rand(4) + 1
  Question.create! name: name, category_id: category_id
  3.times do |answer|
    answer == 1 ? is_correct = "true" : is_correct = "false"
    Answer.create! name: "Answer#{answer}", is_correct: is_correct,
      question_id: "#{question + 1}"
  end
end

5.times do
  user_id = Random.rand(4) + 1
  category_id = Random.rand(4) + 1
  Lesson.create!(user_id: user_id, category_id: category_id)
end

5.times do
  user_id = Random.rand(4) + 1
  question_id = Random.rand(4) + 1
  lesson_id = Random.rand(3) + 1
  answer_id = Random.rand(4) + 1
  Result.create!(user_id: user_id, question_id: question_id, lesson_id: lesson_id, answer_id: answer_id)
end
