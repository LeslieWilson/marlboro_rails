# Card to represent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace).


class Card
    attr_accessor :suite, :rank
    def initialize(suite, rank)
        @rank = rank
        @suite = suite
    end

    def face_card?
        ['j', 'q', 'k'].include?(@rank)
    end
end
