import React from "react";
import RatingQuestion from "../RatingQuestions/RatingQuestion";
import styles from "../RatingQuestions/index.module.scss";

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
      <div className={styles.list}>
        {surveyData.ratingQuestions.map(question => (
          <RatingQuestion
            key={question.id}
            deleteQuestion={deleteQuestion}
            question={question}
            ratingQuestionsUrl={removeJsonFromUrl()}
          />
        ))}
      </div>
    </div>
  );
};

export default Survey;
