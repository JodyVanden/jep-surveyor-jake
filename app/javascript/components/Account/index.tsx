import React from "react";
import ApolloClient from "apollo-client";
import { ApolloProvider } from "react-apollo";
import { createHttpLink } from "apollo-link-http";
import { setContext } from "apollo-link-context";
import SignIn from "./SignIn";
import { InMemoryCache } from "apollo-cache-inmemory";

const authLink = setContext((_, { headers }) => {
  // get the authentication token from local storage if it exists
  const token = localStorage.getItem("token");
  // return the headers to the context so httpLink can read them
  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : ""
    }
  };
});

const httpLink = createHttpLink({
  uri: "http://localhost:3000/graphql"
});

const client = new ApolloClient({
  link: authLink.concat(httpLink),
  cache: new InMemoryCache()
});

import { gql } from "apollo-boost";
// or you can use `import gql from 'graphql-tag';` instead

console.log(window.localStorage.getItem("token"));
client
  .query({
    query: gql`
      {
        account {
          id
          name
          users {
            id
            name
            email
          }
          surveys {
            id
            name
            ratingQuestions {
              id
              title
            }
          }
        }
      }
    `
  })
  .then(result => console.log("RESULTS", result));

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
