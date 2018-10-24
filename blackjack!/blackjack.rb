# Card to represent an individual playing card. This class should contain the suit and the value and provide methods for determining what type of card it is (e.g. face card or ace).


# suites = ['c','h','s']
# values = ['a', 2, 3, 4]
#
#
# class Card
#     def initialize(suite, value)
#         @suits = suites
#         @values = values
#         array_of_cards = []
#         suites.each do |suite|
#             values.each do |value|
#                 array_of_cards << Card.new(value, suite)
#     end
# end
# end
#
# end



class Card
    def initialize(rank, suit)
        @rank = rank
        @suit = suit
    end

    def face_card?
        ['J', 'Q', 'K'].include?(@rank)
    end
end
 
