class Types::QueryType < Types::BaseObject

  field :user, Types::UserType, null: true, description: "Retrieve a user by ID" do
    argument :id, ID, required: true, description: 'A user id'
  end

  def user(id:)
    User.where(id: id).first
  end

  field :post, Types::PostType, null: true, description: "Retrieve a post by ID" do
    argument :id, ID, required: true, description: 'A post id'
  end

  def post(id:)
    Post.where(id: id).first
  end

  field :comment, Types::CommentType, null: true, description: "Retrieve a comment by ID" do
    argument :id, ID, required: true, description: 'A comment id'
  end

  def comment(id:)
    Comment.where(id: id).first
  end
end
