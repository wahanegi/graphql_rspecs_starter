module UserServices
  class Session
    attr_reader :user

    def initialize(user:)
      @user = user
    end

    # Move over functionality from the following GraphQL methods
    # and write unit tests:
    #   - user_type.rb#address

  end
end