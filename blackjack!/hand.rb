require_relative 'deck'
require_relative 'card'



class Hand
    attr_accessor :card_1, :card_2
    def initialize(card_1, card_2)
        @card_1 = card_1
        @card_2 = card_2
    end


    def player_hits
        puts "hit or stand? (choose 'hit' or 'stand')"
        hORs_input = gets.chomp.downcase
        if hORs_input == 'hit'
            puts "#{@dealt_card} was added to your deck"
        end
    end
end


hand = Hand.new(3,5)
hand.player_hits()




# def display_score
#     dispays the players score each time they need to hit or stand
#     outputs player score: SCORE on a seperate line
#     aces shoudl count as one or 11, whichever is closet to 21 without going over
# end
