class RatingQuestionProps
  attr_reader :rating_questions

  def initialize(rating_questions)
    @rating_questions = rating_questions
  end

  def to_props
    {
      questions: @rating_questions.map do |rating_question|
        {
          id: rating_question.id.to_s,
          title: rating_question.title,
          # randomNumber: random_number
        }
      end
    }
  end

  def random_number
    rand(100)
  end
end
