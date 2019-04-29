module RatingQuestionsHelper
  def rating_question_props
    RatingQuestionProps.new(@rating_questions).to_props
  end
end
