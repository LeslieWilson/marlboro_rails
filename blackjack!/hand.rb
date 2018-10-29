require_relative 'deck'
require_relative 'card'



class Hand
    attr_accessor :card_1, :card_2
    def initialize(card_1, card_2)
        @card_1 = card_1
        @card_2 = card_2
    end


def display_score
    dispays the players score each time they need to hit or stand
    outputs player score: SCORE on a seperate line
    aces shoudl count as one or 11, whichever is closet to 21 without going over
end

def add_card(card)
end


end
