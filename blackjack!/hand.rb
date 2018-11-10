require_relative 'deck'
require_relative 'card'

class Hand
    attr_accessor :card_1, :card_2
    def initialize(card_1, card_2)
        @card_1 = card_1
        @card_2 = card_2
        @hand_array = [@card_1, @card_2]

    end

    def add_card(card)
        @hand_array << card
    end

    def display_score
        sum = 0
        @hand_array.each do |card|
            if card.face_card? == true
                sum +=10
            elsif card.rank == 'a' && sum <= 10
                sum += 11
            elsif card.rank == 'a' && sum > 10
                sum += 1
            else
                sum += card.rank
            end
        end

    return sum
    end
end

    #if you get over 21 you lose
    #all the face cards are worth 10
    #ace is either worth 1 or 11 and that is determined by
    #if the 11 doesnt make you over 21 than its an 11, otherwise its a 1
#     dispays the players score each time they need to hit or stand
#     outputs player score: SCORE on a seperate line
#     aces shoudl count as one or 11, whichever is closet to 21 without going over
# end
#
# def add_card(card)
# end
#
#
# end
