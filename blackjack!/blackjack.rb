require_relative 'card'



class Deck
    attr_accessor :deck_o_cards
    def initialize()

        suites = ['c','h','s']
        ranks = ['a', 2, 3, 4,'j']
        @deck_o_cards = []
        suites.each do |suite|
            ranks.each do |rank|
                @deck_o_cards << Card.new(suite,rank)
            end
        end
    end


end



card = Card.new('c', 'k')
puts card.face_card?
deck = Deck.new()

deck.deck_o_cards.each do |card|
    puts "#{card.suite} #{card.rank}"
end
