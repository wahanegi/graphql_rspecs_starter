require 'rails_helper'

describe UserServices::Update do
  let!(:user) { FactoryBot.create(:user) }
  let(:resolver) { UserServices::Update.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(resolver).to be_present
    end

    it 'user attr_reader is present' do
      expect(resolver.user).to eq(user)
    end
  end


  # TEST SUGGESTIONS (TDD PREFERRED)

  describe 'methods' do
    describe '#update' do

      it 'updates user attributes'

    end

  end

end