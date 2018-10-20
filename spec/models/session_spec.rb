require 'rails_helper'

describe Session do
  let!(:session) { FactoryBot.create(:session) }

  context 'Factory' do
    it 'works' do
      expect(session).to be_valid
    end

    it 'can belong to a user' do
      expect(User.exists?(session.user.id)).to be_truthy
    end
  end
end