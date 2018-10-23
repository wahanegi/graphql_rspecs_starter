# GraphQL Rspecs Assignment

This is based on the the homework assignment from the [Udemy Basics of GraphQL with Ruby](https://www.udemy.com/basics-of-graphql-with-ruby-on-rails) 
(second and third assignments) in the "Basics of GraphQL in Ruby on Rails" course on Udemy.

It's been modified in the following ways:
1. RVM style gemset added: `graphql_blog`.
2. rspec-rails, factory-bot-rails, faker and awesome_print gems installed.
3. Model specs added for User, Comment, Post and Session.
4. New classes created with some filler specs to get you started.

### Cloning the repo and getting set up locally
Fork this repo to your personal github and then clone that to your local environment. 
1. Click on the "Fork" link on this repo's page (top right) in Github.
2. Click "Clone or Download" green button and copy the content in the box there.
3. In terminal go to your workspace and clone it via `$ git clone git@github.com:YOUR_GITHUB_HANDLE/graphql_rspecs.git`.
4. Using terminal enter the directory locally: `$ cd graphql_rspec_starter`.
5. If it prompts you to install a new Ruby version follow the directions.
6. Install the bundler gem into your empty gemset: `$ gem install bundler`.
7. Run bunlder to install current gems into gemset: `$ bundle`
8. Instantiate the database: `$ rails db:create`
9. Run current migrations: `$ rails db:migrate`

At this point you should be able to run tests by doing `$ rspec` and they should all pass or show as pending.

### Abstraction Approach to Tests
Please read the [GraphQL's Testing Document](http://graphql-ruby.org/schema/testing.html). How we plan on handling 
GraphQL server side testing differently than this article:
  - If the functionality saves to the database (mutations for example) then put these classes in `/app/services` like we do now. 
  - If it's business logic that does _not_ save to the database that we should still test, put these into classes into the `/app/graphql/resolvers` folder.
  - Corresponding spec files should go in `/spec/graphql/resolvers` and `/spec/services/`. 

### Automated Test Instructions
In Rubymine at the bottom, look for "6: TODO" and click on that. It will show you to places where you should move
business logic to various classes in `/graphql/resolvers` and `/services/user_services`.
 - app/graphql/types/mutation_type.rb line 18
 - app/graphql/types/query_type.rb lines 33 and 40
 - app/graphql/types/user_type.rb line 38

### Manual Testing Instructions
After you've moved business logic into classes and have green tests on them it's still possible that the interaction between the
classes and GraphQL was broken in the process. To make sure everything on the GraphQL side still functions properly:
1. Run `$ rails db:seed` in terminal.
2. Start your Rails server. In terminal you can do this through `$ rails s`.
3. Use [GraphiQL](https://electronjs.org/apps/graphiql) to test the methods you previously changed to make sure they still work.

##### Testing `user_type#address` Changes
```graphql
{
    user(id: 1) {
        id
        address
    }
}
```

##### Testing `query_type#login` Changes

```graphql
{
    login(email:"boss@cloverpop.com", password:"Password!")
}
```
In console, verify that a session was created:
```ruby
> user = User.find_by(email: 'boss@cloverpop.com')
> user.sessions.count > 0
```

##### Testing `query_type#logout` Changes
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
> user.sessions.count == 0
```


##### Testing `mutation_type#update_user` Changes

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
Then verify that the firstName and lastName were updated properly to "Jane" and "NewBoss":
```graphql
{
  user(id: 1) {
    firstName
    lastName
  }
}
```

### Assignment Submission

After you have completed the assignment, send a link of your repo to Roger and Ben for review.