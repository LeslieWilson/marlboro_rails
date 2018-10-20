
# suits = ['clubs', 'diamonds', 'hearts', 'spades']
# numbers = ['ace',2,3,4,5,6,7,8,9,10, 'jack', 'queen', 'king']
#



class Card
    attr_accessor :suit, :number

    def initialize(suit, number)
        @suit = suit
        @number = number

    end

    def facecheck
        if @number == 'jack' || @number == 'king' || @number == 'queen'
            return true
        else
            return false
        end
    end

    def checker
        if @suit == 'ace'
            return true
        else
            return false

        end
    end
end
