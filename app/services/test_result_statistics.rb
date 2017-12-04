class TestResultStatistics

  def initialize(test_result)
    @test_result = test_result
  end

  def statistic_hash
    hash_json = {}
    right_ids = []
    @test_result.finished_variants.each do |f_var|
      hash_json[f_var.variant.id] = {
        corrects_number: AnswerStatistics.corrects_number(f_var)
      }
      right_ids += AnswerStatistics.correct_choices(f_var.variant)
    end
    hash_json[:correct_ids] = right_ids

    hash_json
  end
end