require 'spec_helper'



RSpec.describe Hand do
    let(:hand){hand = Hand.new(card_1 , card_2)}
    let(:card_1){card_1 = Card.new("club", 10)}
    let(:card_2) {card_2 = Card.new("spade", 7)}

    describe ".new" do
        it "makes a hand that passes two cards through it" do
            expect(hand).to be_a(Hand)

        end
    end

    describe "#add_card" do
        it "puts cards in an array" do
            card = Card.new("club", 10)
            hand.add_card(card)
            expect(hand.hand_array).to include(Card)
        end
    end

    describe "#display_score" do
        it "calculates the current score" do
        expect(hand.display_score).to eq(17)

        end
    end



end
# class Hand
#     attr_accessor :card_1, :card_2
#     def initialize(card_1, card_2)
#         @card_1 = card_1
#         @card_2 = card_2
#         @hand_array = [@card_1, @card_2]
#
#     end
#
#     def add_card(card)
#         @hand_array << card
#     end
#
#     def display_score
#         sum = 0
#         @hand_array.each do |card|
#             if card.face_card? == true
#                 sum +=10
#             elsif card.rank == 'a' && sum <= 10
#                 sum += 11
#             elsif card.rank == 'a' && sum > 10
#                 sum += 1
#             else
#                 sum += card.rank
#             end
#         end
#
#     return sum
#     end
# end
