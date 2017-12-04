class PrepareComplexTesting
  def initialize(fifth_lesson)
    @lesson = Lesson.find(fifth_lesson)
  end

  def lessons
    lessons = Lesson.basic.to_a
    lessons << @lesson
    lessons
  end
end