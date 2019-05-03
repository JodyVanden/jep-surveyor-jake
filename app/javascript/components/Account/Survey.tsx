import React from "react";
import RatingQuestion from "../RatingQuestions/RatingQuestion";

const deleteQuestion = () => {
  console.log("delete question clicked");
};

const removeJsonFromUrl = () => {
  console.log("removeJsonFromUrl clicked");
  return "string";
};

const Survey = ({ surveyData }) => {
  return (
    <div>
      <h2>{surveyData.name}</h2>
      {surveyData.ratingQuestions.map(question => (
        <RatingQuestion
          key={question.id}
          deleteQuestion={deleteQuestion}
          question={question}
          ratingQuestionsUrl={removeJsonFromUrl()}
        />
      ))}
    </div>
  );
};

export default Survey;
