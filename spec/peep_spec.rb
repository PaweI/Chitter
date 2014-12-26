require 'spec_helper'

describe Peep do

  context "can be" do

    it "created in DB" do
      expect(Peep.count).to eq 0
      Peep.create("Hello Sam")
      expect(Peep.count).to eq 1
      expect(Peep.first.message).to eq "Hello Sam"
    end

    it "created with time property" do 
      Peep.create("Hello Sam")
      expect(Peep.first.time.hour).to eq Time.now.hour
      expect(Peep.first.message).to eq "Hello Sam"
    end

    it "max up to 140 characters long" do
      Peep.create("Hello"*30)
      expect(Peep.count).to eq 0
    end
    
  end
end