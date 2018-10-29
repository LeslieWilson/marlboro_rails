require_relative 'deck'

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
