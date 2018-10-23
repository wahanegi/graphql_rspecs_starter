require 'rails_helper'

describe Resolvers::User do
  let!(:user) { FactoryBot.create(:user) }
  let(:resolver) { Resolvers::User.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(resolver).to be_present
    end

    it 'user attr_reader is present' do
      expect(resolver.user).to eq(user)
    end
  end

  describe 'methods' do

    # WRITE THE FOLLOWING TESTS (TDD PREFERRED)
    describe '#address' do

      it 'works by separating fields with commas'

      it 'skips fields that are blank'

    end

  end

end