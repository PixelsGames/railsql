desc 'Создаём тестовый вариант для нового предмета'
namespace :lessons do
  task create_variant: :environment do
    def create_variant(lesson_name)
      lesson = Lesson.where(name: lesson_name).first

      unless lesson
        puts 'Не найден такой предмет'
        return
      end

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
      if variant.save
        puts "Вариант с id #{variant.id} создан"
      else
        puts "Вариант не создан! #{variant.errors.messages}"
      end
    end

    create_variant(ENV['LESSON'])
  end
end
