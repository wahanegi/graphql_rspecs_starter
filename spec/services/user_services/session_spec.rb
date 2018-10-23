require 'rails_helper'

describe UserServices::Session do
  let!(:user) { FactoryBot.create(:user) }
  let(:resolver) { UserServices::Session.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(resolver).to be_present
    end

    it 'user attr_reader is present' do
      expect(resolver.user).to eq(user)
    end
  end


  # WRITE THE FOLLOWING TESTS (TDD PREFERRED)

  describe 'methods' do
    describe '#login' do

      it 'creates a session when called'

      it 'generates a session key and returns it'

    end

    describe '#logout' do

      it 'destroys all sessions'

      it 'returns true'

    end

    describe '#update' do

      it 'updates hash attributes passed'

      it 'ignores passed id if present'

    end

  end

end