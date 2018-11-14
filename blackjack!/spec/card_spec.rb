require 'spec_helper'

RSpec.describe Card do
    let(:card) {card = Card.new("club", 10)}

    describe '.new' do
        it "takes a suite and rank as arguments" do
            expect(card).to be_a(Card)
        end
    end


    describe "#suite" do
        it "returns a suite" do
            expect(card.suite).to eq("club")
            expect(card.suite).not_to eq("spade")
        end
    end

    describe "#rank" do
        it "returns a rank" do
            expect(card.rank).to eq(10)
            expect(card.rank).not_to eq(11)
        end
    end

    describe "#face_card?" do
        card2 = Card.new("club", 'j')
        it "tells you if you have a facecard" do
            expect(card2.face_card?).to eq(TRUE)
            expect(card.face_card?).to eq(FALSE)
    end

end




end
