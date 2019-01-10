require 'spec_helper'

describe "Launcher League" do
  let!(:the_zap)          { Speedster.new("The Zap", "Allie Barron") }
  let!(:ultradude)        { Brawler.new("Ultradude", "Kyle Carter") }
  let!(:nightbird)        { Detective.new("Nightbird", "Luke Bayne") }
  let!(:eris_esoteric)    { Demigod.new("Eris Esoteric", "Dinah King") }
  let!(:venus_vengeance)  { JackOfAllTrades.new("Venus Vengeance", "j'enn j'ord") }
  let!(:waterguy)    { WaterBased.new("Waterguy", "Cort Hale")}

  describe "The Detective" do

    it " has a backstory" do
      expect(nightbird.backstory).to_not be_empty
    end

    it "has powers" do
      expect(nightbird.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(nightbird.weakness).to_not be_empty
    end

    it "is human" do
      expect(nightbird.species).to eq "Human"
    end

    it "is from earth" do
      expect(nightbird.home).to eq "Earth"
    end

    it "has 500 fans per thousand" do
      expect(nightbird.fans_per_thousand).to eq 500
    end

    it "has a weakness to its own private identity" do
      expect(nightbird.weakness).to eq "Luke Bayne"
    end

    it "has average health" do
        expect(nightbird.health).to eq 100
    end

    it "is slow" do
      expect(nightbird.speed_in_mph).to eq 10
    end

    it "is not psychic" do
      expect(nightbird.psychic?).to eq false
    end
  end

  describe "The Brawler" do

    it " has a backstory" do
      expect(ultradude.backstory).to_not be_empty
    end

    it "has powers" do
      expect(ultradude.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(ultradude.weakness).to_not be_empty
    end

    it "is human" do
      expect(ultradude.species).to eq "Human"
    end

    it "is from earth" do
      expect(ultradude.home).to eq "Earth"
    end

    it "has 500 fans per thousand" do
      expect(ultradude.fans_per_thousand).to eq 500
    end

    it "is as healthy as 20 healthy adults!" do
      expect(ultradude.health).to eq 2000
    end

    it "has an average speed" do
      expect(ultradude.speed_in_mph).to eq 60
    end

    it "is not psychic" do
      expect(ultradude.psychic?).to eq false
    end
  end

  describe "The Demigod" do

    it " has a backstory" do
      expect(eris_esoteric.backstory).to_not be_empty
    end

    it "has powers" do
      expect(eris_esoteric.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(eris_esoteric.weakness).to_not be_empty
    end

    it "is human" do
      expect(eris_esoteric.species).to eq "Human"
    end

    it "has 500 fans per thousand" do
      expect(ultradude.fans_per_thousand).to eq 500
    end

    it "is from a mystical realm" do
      expect(eris_esoteric.home).to eq "Cosmic Plane"
    end

    it "has average health" do
        expect(eris_esoteric.health).to eq 100
    end

    it "has an average speed" do
      expect(eris_esoteric.speed_in_mph).to eq 60
    end

    it "is not psychic" do
      expect(eris_esoteric.psychic?).to eq false
    end
  end

  describe "The WaterBased" do

    it " has a backstory" do
      expect(waterguy.backstory).to_not be_empty
    end

    it "has powers" do
      expect(waterguy.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(waterguy.weakness).to_not be_empty
    end

    it "is human" do
      expect(waterguy.species).to eq "Human"
    end

    it "is from the Earth's Oceans  " do
      expect(waterguy.home).to eq "Earth's Oceans"
    end

    it "has average health" do
        expect(waterguy.health).to eq 100
    end

    it "has an average speed" do
      expect(waterguy.speed_in_mph).to eq 60
    end

    it "does not have many fans" do
      expect(waterguy.fans_per_thousand).to eq 5
    end

    it "is psychic" do
      expect(waterguy.psychic?).to eq true
    end
  end

  describe "The Speedster" do

    it " has a backstory" do
      expect(the_zap.backstory).to_not be_empty
    end

    it "has powers" do
      expect(the_zap.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(the_zap.weakness).to_not be_empty
    end

    it "is human" do
      expect(the_zap.species).to eq "Human"
    end

    it "is from earth" do
      expect(the_zap.home).to eq "Earth"
    end

    it "has 500 fans per thousand" do
      expect(the_zap.fans_per_thousand).to eq 500
    end

    it "goes really, really fast!" do
      expect(the_zap.speed_in_mph).to eq 60000
    end

    it "has average health" do
        expect(the_zap.health).to eq 100
    end

    it "is not psychic" do
      expect(the_zap.psychic?).to eq false
    end
  end

  describe "The Jack of all trades" do

    it " has a backstory" do
      expect(venus_vengeance.backstory).to_not be_empty
    end

    it "has powers" do
      expect(venus_vengeance.powers).to_not be_empty
    end

    it "has a weakness" do
      expect(venus_vengeance.weakness).to_not be_empty
    end

    it "is an alien" do
        expect(venus_vengeance.species).to eq "Alien"
    end

    it "from venus!" do
      expect(venus_vengeance.home).to eq "Venus"
    end

    it "has 500 fans per thousand" do
      expect(venus_vengeance.fans_per_thousand).to eq 500
    end

    it "has an average speed" do
      expect(venus_vengeance.speed_in_mph).to eq 60
    end

    it "has average health" do
        expect(venus_vengeance.health).to eq 100
    end

    it "is psychic" do
      expect(venus_vengeance.psychic?).to eq true
    end
  end

end
