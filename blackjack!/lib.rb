require_relative 'deck'
require_relative 'hand'
require_relative 'card'

puts "would you like to play blackjack? (y/n)"
start = gets.chomp
if start == 'y'
    new_deck = Deck.new
    new_deck.deal
    player_hand = Hand.new(new_deck.deal, new_deck.deal)
    puts "you have an #{player_hand.card_1.suite} and #{player_hand.card_1.rank} and a #{player_hand.card_2.suite} and #{player_hand.card_2.rank}  in your hand"
end



# new_deck = Deck.new
# print new_deck.deck_o_cards
# new_card = new_deck.deal
# puts "lkjefhlaskjdfhslakjfhdas"
# print new_deck.deck_o_cards
# puts new_card.suite







#deal them a hand new_deck.deal gives me a card and need to tell them whats in their hand.

#deal logic
# Deal initial hand
# As a dealer
# I want to initially deal out two cards to the current player
# So that we can begin the game
# Acceptance Criteria:
#
# Cards are dealt from a shuffled deck of 52 cards.
# Output Player was dealt CARD for each card the player receives.
# Output Dealer was dealt CARD for each card the dealer receives.



#need to impliment deal! method in deck.rb in hand.rb

# so how do i take the @dealt card from this:
#     def deal(card)
#         @dealt_card = @deck_o_cards.pop do |card|
#         puts "player was delt #{@dealt_card}card"
#         puts "dealer was dealt #{@dealt_card} card"
#     end
#     end
#
#     ...in deck and get it into
#
#     def player_hits
#         puts "hit or stand? (choose 'hit' or 'stand')"
#         hORs_input = gets.chomp.downcase
#         if hORs_input == 'hit'
#             puts "#{@dealt_card} was added to your deck"
#         end
#     end
# end
#
# in hand? it's not showing up when I do it this way, I have a require relative between the files no problem.