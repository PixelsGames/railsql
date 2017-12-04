# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def create_variant(lesson)
  variant = Variant.new(lesson: lesson)
  25.times do |n|
    question_body = "Тестовый вопрос для урока #{lesson.name} #{n + 1}"
    question_hash = { body: question_body,
                      lesson_id: lesson.id,
                      choices_attributes: {}
                    }
    right_answer_pos = rand(5)
    5.times do |x|
      correct = right_answer_pos == x
      question_hash[:choices_attributes][x] = {
        body: "Choice№ #{x + 1} #{'correct' if correct}",
        correct: right_answer_pos == x
      }
    end
    question = Question.new(question_hash)
    variant.questions << question
  end

  variant.save
end

# creates schools
%w[Алмалыбак №65 Центральная].each { |x| School.create(name: x) }
%w[Алматы Астана Шымкент].each { |x| City.create(name: x) }

# creates optional lessons
optional_lessons = ['Биология',
 'География',
 'Физика',
 'Английский язык',
 'Всемирная история',
 'Химия',
 'Немецкий язык',
 'Французский язык']


# creates basic lessons
basic_lessons = ['Математика',
 'Русский язык',
 'Казахский язык',
 'История Казахстана']

optional_lessons.each do |lesson|
  lesson = Lesson.where(name: lesson).first
  create_variant(lesson)
end

basic_lessons.each { |lesson| Lesson.create(name: lesson, basic: true) }

basic_lessons.each do |lesson|
  lesson = Lesson.where(name: lesson).first
  create_variant(lesson)
end

# creates admin
User.create(role: 1,
            name: 'Admin',
            surname: 'profile',
            email: 'admin@admin.ent',
            password: '123123',
            school_id: School.first.id,
            city_id: City.first.id
)