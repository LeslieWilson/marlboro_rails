require_relative 'card'

class Deck
    attr_accessor :deck_o_cards, :deal
    def initialize
        suites = ['c','h','s']
        ranks = ['a', 2, 3, 4,'j']
        @deck_o_cards = []
        suites.each do |suite|
            ranks.each do |rank|
                @deck_o_cards << Card.new(suite,rank)
            end
        end
        @deck_o_cards.shuffle!
    end

def deal(card)
    @dealt_card = @deck_o_cards.pop do |card|
    puts "player was delt #{@dealt_card}card"
    puts "dealer was dealt #{@dealt_card} card"
end
end

end


deck = Deck.new
deck.deal(1)






# card = Card.new('c', 'k')
# puts card.face_card?
# deck = Deck.new()
#
# deck.deck_o_cards.each do |card|
#     puts "#{card.suite} #{card.rank}"
# end
