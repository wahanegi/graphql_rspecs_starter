require 'rails_helper'

describe UserServices::Update do
  let!(:user) { FactoryBot.create(:user) }
  let(:service) { UserServices::Update.new(user: user) }

  describe 'class' do
    it 'exists' do
      expect(service).to be_present
    end

    it 'user attr_reader is present' do
      expect(service.user).to eq(user)
    end
  end


  # TEST SUGGESTIONS (TDD PREFERRED)

  describe 'methods' do
    describe '#update' do

      it 'updates user attributes'

    end

  end

end