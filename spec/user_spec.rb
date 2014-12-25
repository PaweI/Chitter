require 'spec_helper'

describe User do

  def create_user
    User.create(email: "test@test.com",
                password: "helloworld")
  end
    

  context 'can be' do

    it 'created in the db' do
      expect(User.count).to eq 0
      create_user
      expect(User.count).to eq 1
    end

    it 'retrieved from db' do
      create_user
      user = User.first
      expect(user.email).to eq "test@test.com"
      expect(user.password).to eq "helloworld"
    end

    it 'deleted by DataBaseCleaner' do
      expect(User.count).to eq 0
    end

  end

end