Hello!

This is the instructor's solution for the first homework in the "Basics of GraphQL in Ruby on Rails" course on Udemy.

To try out the code, start the Rails app, enter its endpoint into GraphiQL (ex. http://localhost:3000/graphql) and use a query like this one:

```graphql
{
  user(id: 1) {
    id
    firstName
    createdAt
    address
    posts {
      id
      body
      comments {
        id
        body
      }
    }
  }
}
```