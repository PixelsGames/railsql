class TestResultsController < ApplicationController

  skip_before_action :verify_authenticity_token, :only => [:create]

  def new
    @lessons = Lesson.all
    @test_result = TestResult.new
  end

  def create
    json_hash = variant_params.to_hash

    complex_test = json_hash.keys.count > 1
    tr = TestResult.create(user: current_user, complex: complex_test)

    json_hash.keys.each do |key|
      CreateFinishedVariant.new(json_hash[key], tr).exec
    end

    render json: TestResultStatistics.new(tr).statistic_hash
  end

  def show
    @lessons = []
    if params[:id] != 'blank'
      @lessons << Lesson.find(params[:id])
    else
      @lessons = PrepareComplexTesting.new(test_sample_params[:lesson])
                      .lessons
    end

    @variants = []

    with_empty_var = false
    @lessons.each do |lesson|
      variant = RandomTestCreator.new(lesson).random_variant
      with_empty_var = variant.present?
      break unless with_empty_var
      @variants << variant
    end

    unless with_empty_var
      redirect_to new_test_result_path, notice: 'В выбранном предмете отсутствуют варианты'
    end
  end

  def profile
    user_results = TestResult.where(user: current_user)
    @complex_resutls = user_results.where(complex: true)
    @single_resutls = user_results.where(complex: false)
  end

  private

  def test_result_params
    params.require(:order).permit!
  end

  def test_sample_params
    params.require(:test_result_sample).permit(:lesson)
  end

  def variant_params
    params.require('variants').permit!
  end
end