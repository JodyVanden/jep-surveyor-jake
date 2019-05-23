import * as React from "react";
import * as styles from "./RatingQuestion.module.scss";
import axios from "axios";
import RatingQuestionOption from "./RatingQuestionOption";
import { Button } from "@cultureamp/kaizen-component-library";

interface RatingQuestionProps {
  question: { title: string; id: string };
  deleteQuestion: any;
  ratingQuestionsUrl: string;
}

class RatingQuestion extends React.Component<RatingQuestionProps> {
  questionData = { ...this.props.question };

  state = {
    selectedOption: "Nothing selected",
    updatedQuestionNameInput: "",
    questionTitle: this.props.question.title
  };

  optionSelected = (e: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ selectedOption: e.target.value });
  };

  //---------------------UPDATE QUESTION TITLE FUNCTIONS------------------

  updateQuestionNameInput = (e: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ updatedQuestionNameInput: e.target.value });
  };

  updateQuestionName = (e: React.MouseEvent<HTMLButtonElement>) => {
    if (this.state.updatedQuestionNameInput) {
      axios
        .put(`${this.props.ratingQuestionsUrl}/${this.questionData.id}.json`, {
          title: this.state.updatedQuestionNameInput
        })
        .then(res => {
          this.setState({
            questionTitle: this.state.updatedQuestionNameInput,
            updatedQuestionNameInput: ""
          });
        })
        .catch(err => {
          console.log(err);
        });
    } else {
      alert("Please enter something first!");
    }
  };

  renderQuestionOptions = () => {
    return this.questionValues.map((questionValue, i) => {
      return (
        <RatingQuestionOption
          key={questionValue}
          questionId={this.questionData.id}
          value={questionValue}
          optionSelected={this.optionSelected}
        />
      );
    });
  };

  avulseString = (string, maxLength) => {
    if (string.length > maxLength) {
      return string.substring(0, maxLength) + "..";
    } else {
      return string;
    }
  };

  //----------------------------------------------------------------------
  questionValues = [
    "strongly-disagree",
    "disagree",
    "neutral",
    "agree",
    "strongly-agree"
  ];

  optionColors: any = {
    "strongly-disagree": "#d31d3b",
    disagree: "#ea7b04",
    neutral: "#f2da00",
    agree: "#b9f100",
    "strongly-agree": "#3dce04"
  };

  render() {
    return (
      <div className={styles.questionContainer}>
        <div className={styles.questionContainer}>
          <div className={styles.questionColumn}>
            <a
              href={
                this.props.ratingQuestionsUrl
                  ? `${this.props.ratingQuestionsUrl}/${this.questionData.id}`
                  : null
              }
              className={styles.questionTitle}
            >
              "{this.avulseString(this.state.questionTitle, 70)}"
            </a>
            <div className={styles.changeTitleContainer}>
              <input
                className={styles.changeTitleInput}
                type="text"
                value={this.state.updatedQuestionNameInput}
                placeholder="new title"
                onChange={this.updateQuestionNameInput}
              />
              <Button label="update" onClick={this.updateQuestionName} />
            </div>

            <Button
              label="delete"
              onClick={this.props.deleteQuestion}
              data-question-id={this.questionData.id}
            />
          </div>
          <div className={styles.answersColumn}>
            <div className={styles.optionsContainer}>
              {this.renderQuestionOptions()}
            </div>
            <h1
              className={styles.selectionIndicator}
              style={{
                background: this.optionColors[this.state.selectedOption]
              }}
            />
          </div>
        </div>
      </div>
    );
  }
}

export default RatingQuestion;
