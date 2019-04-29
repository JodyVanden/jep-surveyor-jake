module Types
  class MutationType < Types::BaseObject
    field :create_rating_question, CreateRatingQuestionResult, null: false do
      argument :title, String, required: true
    end


    field :delete_rating_question, RatingQuestionType, null: true do
      argument :id, ID, required: true
    end

    field :update_rating_question, RatingQuestionType, null: false do
      argument :id, ID, required: true
      argument :title, String, required: true
    end

    def create_rating_question(title:)
      RatingQuestion.create(title: title)
    end

    def delete_rating_question(id:)
      target_question = RatingQuestion.find(id)
      target_question.destroy
      { id: id }
    end

    def update_rating_question(id:, title:)
      target_question = RatingQuestion.find(id)
      target_question.title = title
      target_question.save
      {id: id, title: title}
    end
  end
end
