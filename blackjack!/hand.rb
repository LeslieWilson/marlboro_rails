require_relative ''

class Hand
    attr_accessor :deal
    def initialize(deal)
        @deal = deal
    end

    puts 'start? (y/n)'
    start_input = gets.chomp
    if start_input = 'y'
        puts 


        #deals two cards to player. dealt from 52 cards. output 'player was delt card'

        # then be prompted to hit or stand. keep prompting unless the player stands or busts. so say "Hit or stand' and read user input on the same line". notify if input is invalid, reprompt. make upcase and lowercase.

end

def display_score
end
