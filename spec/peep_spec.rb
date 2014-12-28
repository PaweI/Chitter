require 'spec_helper'

describe Peep do

  before(:each) do
    User.create(name: "Vasya Pupkin",
                username: "glitch",
                email: "test@test.com",
                password: "helloworld",
                password_confirmation: "helloworld")
  end

  let(:user) { User.first }

  context "can" do

    it 'not be created without user' do
      expect(Peep.count).to eq 0
      Peep.create(message: "Hello Sam")
      expect(Peep.count).to eq 0
    end

    it "be created in DB" do
      expect(Peep.count).to eq 0
      Peep.create(message: "Hello Sam", user_id: user.id)
      expect(Peep.count).to eq 1
      expect(Peep.first.message).to eq "Hello Sam"
    end

    it "be created with time property" do 
      Peep.create(message: "Hello Sam", time: Time.now, user_id: user.id)
      expect(Peep.first.time.hour).to eq Time.now.hour
    end

    it "be max up to 140 characters long" do
      Peep.create(message: "Hello"*30, user_id: user.id)
      expect(Peep.count).to eq 0
    end
    
  end
end