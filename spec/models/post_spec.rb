require 'rails_helper'

describe Post do
  let!(:post) { FactoryBot.create(:post) }

  context 'Factory' do
    it 'works' do
      expect(post).to be_valid
    end

    it 'can belong to a user' do
      expect(User.exists?(post.user.id)).to be_truthy
    end

  end
end