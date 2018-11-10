require_relative 'deck'
require_relative 'hand'
require_relative 'card'

puts "would you like to play blackjack? (y/n)"
start = gets.chomp
if start == 'y'
    new_deck = Deck.new
    new_deck.deal
    player_hand = Hand.new(new_deck.deal, new_deck.deal)
    computer_hand = Hand.new(new_deck.deal, new_deck.deal)
    puts "you have an #{player_hand.card_1.rank} of #{player_hand.card_1.suite} and a #{player_hand.card_2.rank} of #{player_hand.card_2.suite} in your hand"
    player_score = player_hand.display_score
    puts "#{player_score}"


while player_hand.display_score <= 21

    puts 'hit or stand?'
    answer = gets.chomp
    if answer == 'stand'
            puts "Ive delt the computer #{computer_hand.card_1.rank} of #{computer_hand.card_1.suite} and a #{computer_hand.card_2.rank} of #{computer_hand.card_2.suite}"
            computer_score = computer_hand.display_score
            puts "#{computer_score}"
            while computer_hand.display_score < 16
                new_compcard = new_deck.deal
                computer_hand.add_card(new_compcard)
                puts "computer was delt a #{new_compcard.rank} of #{new_compcard.suite}"
                new_compscore = computer_hand.display_score
                puts "#{new_compscore}"
                if new_compscore > 21
                    puts 'oh crap the comp busted'
end
end
break
end
    if answer == 'hit'
        new_card = new_deck.deal
        player_hand.add_card(new_card)
        puts "you were delt a #{new_card.rank} of #{new_card.suite} "
        new_score = player_hand.display_score
        puts "#{new_score}"
        if new_score > 21
            puts "oh crap you busted"
        end
end
end
if computer_hand.display_score > player_hand.display_score && computer_hand.display_score < 21
    puts "comp wins"
elsif
     computer_hand.display_score < player_hand.display_score && player_hand.display_score < 21
    puts "player wins"
end
end





# ask them if they will hit or stand and handle for if they hit, which means dealing a new card in their hand and telling them what the new card is and calculating the new score.


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
