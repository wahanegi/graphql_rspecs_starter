# GraphQL Rspecs Assignment

This is based on the the homework assignment from the [Udemy Basics of GraphQL with Ruby](https://www.udemy.com/basics-of-graphql-with-ruby-on-rails) 
(second and third assignments) in the "Basics of GraphQL in Ruby on Rails" course on Udemy.

It's been modified in the following ways:
1. RVM style gemset added: `graphql_blog`.
2. rspec-rails, factory-bot-rails, faker and awesome_print gems installed.
3. Model specs added for User, Comment, Post and Session.
4. A couple specs added with some pending tests to be completed as part of the assignment.

### Cloning the repo and getting started locally
Fork this repo to your personal github and then clone that to your local environment. 
1. Click on the "Fork" link on this page (top right) in Github.
2. Go to settings and change the name of it from `graphql_rspecs_starter` to `graphql_rspecs`.
3. Click "Clone or Download" green button and copy the content in the box there.
4. In terminal go to your workspace and clone it via `$ git clone git@github.com:YOUR_GITHUB_HANDLE/graphql_rspecs.git`.
5. Enter the directory: `$ cd graphql_rspec`.
6. If it prompts you to install a new Ruby version follow the directions.
7. Install the bundler gem into your empty gemset: `$ gem install bundler`.
8. Run bunlder to install current gems into gemset: `$ bundle`
9. Instantiate the database: `$ rails db:create`
10. Run current migrations: `$ rails db:migrate`

At this point you should be able to run tests by doing `$ rspec` and they should all pass or show as pending.

### Abstraction Approach to Tests
Please read the [GraphQL's Testing Document](http://graphql-ruby.org/schema/testing.html). How we plan on handling 
GraphQL server side testing differently than this article:
  - If the functionality saves to the database (mutations for example) then put these classes in `/app/services` like we do now. 
  - If it's business logic that does _not_ save to the database that we should still test, put these into classes located in the `/app/graphql/resolvers` folder.
  - Write unit tests for these classes in `/spec/graphql/resolvers` and `/spec/services/`. 

### Assignment Instructions
1. Fill out the pending specs in `/spec/graphsql/resolvers/user_spec.rb`, then move code from `user_type#address` to `app/graphql/resolvers/user.rb`.
2. Fill out the pending specs in `/specs/services/user_services/session_spec.rb`, then move code from `user_type#login` and `user_type#logout` to `app/services/user_services/session.rb`.
3. Fill out the pending spces in `/specs/services/user_services/user_spec.rb`, then move code from `mutation_type.rb#update_user` to `app/services/user_services/user.rb`.
4. Use [GraphiQL](https://electronjs.org/apps/graphiql) to test the changed methods to verify that they work via the section below.

#### Manual Testing
Review and then run `$ rails db:seed` before running these manual tests in [GraphiQL](https://electronjs.org/apps/graphiql).

##### User Address
```graphql
{
    user(id: 1) {
        id
        address
    }
}
```

##### Login

```graphql
{
    login(email:"boss@cloverpop.com", password:"Password!")
}
```
In console, verify that a session was created:
```ruby
> user = User.find_by(email: 'boss@cloverpop.com')
> ap user.sessions
```

##### Logout
Before running, edit _HTTP Headers_ in [GraphiQL](https://electronjs.org/apps/graphiql):
 - Header name: `Authorization`
 - Header value: `ba21c26ff0522ff1c5b437d35802651bc69e8930`

```graphql
{
    logout
}
```
In console, verify that the session was destroyed:
```ruby
> user = User.find_by(email: 'boss@cloverpop.com')
> user.sessions.count
```


##### Update existing user:

Set Vars:
```json
{
  "user": {
    "id": "1",
    "firstName": "Jane",
    "lastName": "NewBoss",
  }
}
```
Run mutation to update the user:
```graphql
mutation updateUser($user: UserInputType!) {
  updateUser(user:$user) 
}
```
Then verify that the changes were saved properly with a query:
```graphql
{
  user(id: 1) {
    firstName
    lastName
  }
}
```





Once specs are passing and manual tests are completed you can send a link of your repo to Roger and Ben for review.


