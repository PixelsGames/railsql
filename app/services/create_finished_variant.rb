class CreateFinishedVariant

  def initialize(hash, test_result)
    @hash = hash
    @test_result = test_result
  end

  def exec
    @result_hash = {}
    @result_hash[:variant_id] = @hash['variant_id']
    @result_hash[:test_result_id] = @test_result.id

    generate_answers_hash

    FinishedVariant.create(@result_hash)
  end

  private

  def generate_answers_hash
    @result_hash[:answers_attributes] = {}
    i = 0
    @hash['questions'].map { |_k, v| v }.each do |x|
      @result_hash[:answers_attributes][i] = { choice_id: x['choice_id'] }
      i += 1
    end
  end
end