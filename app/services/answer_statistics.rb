module AnswerStatistics

  def self.correct_choices(variant)
    correct_choices = []
    variant.questions.each do |question|
      correct_choices << question.choices
                             .select(&:correct)
                             .first
                             .id
    end
    correct_choices
  end

  def self.corrects_number(finished_variant)
    finished_variant.answers
        .select{ |answer| answer.choice.correct? }
        .map(&:id)
        .count
  end

  def self.test_result_number(test_result)
    result = 0
    test_result.finished_variants.each do |f_var|
      result += corrects_number(f_var)
    end
    result
  end

  def self.all_scores(user)
    scores = []
    user.test_results.where(complex: true)
        .map { |t_result| scores << test_result_number(t_result) }
    scores
  end

  def self.get_optional_lesson(test_result)
    test_result.finished_variants.each do |f_var|
      lesson = f_var.variant.lesson
      return lesson unless lesson.basic
    end
  end
end