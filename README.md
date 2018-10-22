# GraphQL Rspecs Assignment

This is based on the the homework assignment from the [Udemy Basics of GraphQL with Ruby](https://www.udemy.com/basics-of-graphql-with-ruby-on-rails) 
(second and third assignments) in the "Basics of GraphQL in Ruby on Rails" course on Udemy.

It's been modified in the following ways:
1. RVM style gemset added: `graphql_blog`.
2. rspec-rails, factory-bot-rails, faker and awesome_print gems installed.
3. Model specs added for User, Comment, Post and Session.

### Cloning the repo
Fork this repo to your personal github and then clone that to your local environment. 

### Getting Started Locally
This assumes you're using RVM.
1. In terminal, navigate to the folder. If it prompts you to install a new Ruby version follow the directions.
2. `$ gem install bundler`
3. Install current gems into gemset: `$ bundle`
4. Instantiate the database: `$ rails db:create`
5. Run current migrations: `$ rails db:migrate`

At this point you should be able to run tests by doing `$ rspec` and they should all pass.

### Assignment Instructions
Please review the [GraphQL's Testing Document](http://graphql-ruby.org/schema/testing.html). How we plan on handling 
GraphQL server side testing is to abstract complex logic into classes located in the `/app/graphql/resolvers` folder, and then
writing unit tests for those classes in `/spec/graphql/resolvers`.  

1. Create a classes in `/app/graphql/resolvers` and move over code from the following methods: 
    - `app/graphql/types/user_type.rb` methods:
        - `address`
        - `login`
        - `logout`
    - `app/graphql/types/mutation_types.rb` methods:
        - `create_user`
        - `update_user`
        - `delete_user`
        - `create_post`
        - `update_post`
        - `delete_post`
        - `create_comment`
        - `update_comment`
        - `delete_comment`

2. For each of the classes above, create corresponding `_spec.rb` files in `/spec/graphql/resolvers`.

*NOTE: The location we are choosing for these classes (`/app/graphql/resolvers`)
is different than the examples in the testing document (`/app/model/modelname/`).*

While making these new classes please make sure to adhere to Single Responsibility Principle (SRP). Classes should be 
simple and only do one thing.


