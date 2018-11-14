require 'spec_helper'

RSpec.describe Deck do
    let(:deck) {deck = Deck.new}

    describe ".new" do
        it "makes a deck" do
            expect(deck).to be_a(Deck)
        end
    end

    describe "#deck_o_cards" do
        it "stores 52 cards in an array" do
            expect(deck.deck_o_cards.length).to eq(52)


        end
    end

    describe "deal" do
        it "takes the last card and returns it" do
            expect(deck.deal).to be_a(Card)
        end
    end
end
