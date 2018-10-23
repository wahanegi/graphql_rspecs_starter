require 'rails_helper'

describe UserServices::User do
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
    describe '#update' do

      it 'updates hash attributes passed'

      it 'ignores id if present in passed params'

    end

  end

end