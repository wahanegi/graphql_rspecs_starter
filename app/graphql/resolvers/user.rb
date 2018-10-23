module Resolvers
  class User
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    # Write unit tests for this class in /spec/graphql/resolvers/user_spec.rb (preferably TDD style)

  end
end