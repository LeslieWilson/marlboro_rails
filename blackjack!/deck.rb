require_relative 'card'

class Deck
    attr_accessor :deck_o_cards, :deal
    def initialize
        suites = ['clubs','hearts','spades', 'diamonds']
        ranks = ['a', 2, 3, 4,5,6,7,8,9,10,'j', 'q', 'k']
        @deck_o_cards = []
        suites.each do |suite|
            ranks.each do |rank|
                @deck_o_cards << Card.new(suite,rank)
            end
        end
        @deck_o_cards.shuffle!
    end

def deal
    dealt_card = @deck_o_cards.pop
end

# ask them if they will hit or stand and handle for if they hit, which means dealing a new card in their hand and telling them what the new card is and calculating the new score.
end










# card = Card.new('c', 'k')
# puts card.face_card?
# deck = Deck.new()
#
# deck.deck_o_cards.each do |card|
#     puts "#{card.suite} #{card.rank}"
# end
