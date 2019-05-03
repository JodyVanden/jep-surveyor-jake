import React from "react";
import ApolloClient from "apollo-boost";
import { ApolloProvider } from "react-apollo";
import SignIn from "./SignIn";

const client = new ApolloClient({
  uri: "http://localhost:3000/graphql"
});

// import { gql } from "apollo-boost";

// client
//   .query({
//     query: gql`
//       {
//         accounts {
//           id
//           name
//           users {
//             id
//             name
//             email
//           }
//           surveys {
//             id
//             name
//             ratingQuestions {
//               id
//               title
//             }
//           }
//         }
//       }
//     `
//   })
//   .then(result => console.log("RESULTS", result));

class Account extends React.Component {
  render() {
    return (
      <ApolloProvider client={client}>
        <div>
          <h1>Hello from account/index</h1>
          {window.localStorage.getItem("token") ? (
            <p>You are logged in</p>
          ) : (
            <SignIn />
          )}
        </div>
      </ApolloProvider>
    );
  }
}

export default Account;
