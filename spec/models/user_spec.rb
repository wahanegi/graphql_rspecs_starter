require 'rails_helper'

describe User do
  let!(:user) { FactoryBot.create(:user) }

  context 'Factory' do
    it 'works' do
      expect(user).to be_valid
    end

  end
end