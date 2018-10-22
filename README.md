Hello!

This is based on the instructor's solution for the first, second and third assignments in the "Basics of GraphQL in Ruby on Rails" course on Udemy.

It's been modified in the following ways:
1. RVM style gemset added: `graphql_blog`.
2. Rspec installed.
3. Model specs added.

### Getting Started
This assumes you're using RVM.
1. In terminal, navigate to the folder. If it prompts you to install a new Ruby version follow the directions.
2. `$ gem install bundler`
3. Install current gems into gemset: `$ bundle`
4. Instantiate the database: `$ rails db:create`
5. Run current migrations: `$ rails db:migrate`
6. Populate some sample data: `$ rails db:seed`


### To retrieve a user with their posts and comments:
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

### To create a new user:
```graphql
mutation createUser($user: UserInputType!) {
  createUser(user:$user) {
    id
    address
    errors {
      fieldName
      errors
    }
  }
}
```

Example vars:
```json
{
  "user": {
    "firstName": "Someone",
    "lastName": "Some Name",
    "street": "Some Street"
  }
}
```

### To update an existing user:
```graphql
mutation updateUser($user: UserInputType!) {
  updateUser(user:$user) 
}
```

Example vars:
```json
{
  "user": {
    "id": "2",
    "firstName": "Someone",
    "lastName": "Some Name",
    "city": "Some City"
  }
}
```

### To delete an existing user:
```graphql
mutation {
  deleteUser(id:2)
}
```

Similar mutations have been created for Post.

### To create a Post:
```graphql
mutation createPost($post: PostInputType!) {
  createPost(post:$post) {
    id
    user {
      firstName
    }
  }
}
```

Example vars:
```json
{
  "post": { 
    "userId": "1",
    "body": "Some post!"
  }
}
```

### To update a Post:
```graphql
mutation updatePost($post: PostInputType!) {
  updatePost(post:$post) 
}
```

Example vars:
```json
{
  "post": { 
    "id": "2",
    "body": "Some other post!"
  }
}
```

### To delete a Post:
```graphql
mutation {
  deletePost(id: 2)
}
```

And for Comment:

### To create a Comment:

```graphql
mutation createComment($comment: CommentInputType!) {
  createComment(comment:$comment) {
    id
    createdAt
  }
}
```

Example vars:
```json
{
  "comment": { 
    "postId": 1,
    "body": "Some comment!"
  }
}
```

### To update a Comment:

```graphql
mutation updateComment($comment: CommentInputType!) {
  updateComment(comment:$comment) 
}
```

Example vars:
```json
{
  "comment": { 
    "id": "2",
    "body": "Some other comment!"
  }
}
```

### To delete a Comment:
```graphql
mutation {
  deleteComment(id: 2)
}
```

Authentication features:

### Login:
```graphql
{login(email:"a@b.c", password:"1")}
```

### Logout:
```graphql
{logout}
```