require 'rails_helper'

describe Comment do
  let!(:comment) { FactoryBot.create(:comment) }

  context 'Factory' do
    it 'works' do
      expect(comment).to be_valid
    end

    it 'can belong to a post' do
      expect(Post.exists?(comment.post.id)).to be_truthy
    end

  end
end