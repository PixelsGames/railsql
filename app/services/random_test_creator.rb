class RandomTestCreator

  def initialize(lesson)
    @lesson = lesson
  end

  def random_variant
    Variant.where(lesson: @lesson).order('RANDOM()').first
  end
end