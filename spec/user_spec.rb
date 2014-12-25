require 'spec_helper'

describe User do

  context 'can be' do

    it 'created and the retrieved from the db' do
      expect(User.count).to eq 0
      User.create(email: "test@test.com",
                  password: "helloworld",)
      expect(User.count).to eq 1
      user = User.first
      expect(user.email).to eq "test@test.com"
      expect(user.password).to eq "helloworld"
      user.destroy
      expect(User.count).to eq 0
    end

  end

end