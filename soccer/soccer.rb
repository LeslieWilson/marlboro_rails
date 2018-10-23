# Leslie Wilson
# Objects Week 7

# make a soccer team object that initiates with an array of players, make a method that adds players, a method that removes players, teams can only have 15 players and have to have at least 11 players so factor that in to your object


class Team
    attr_accessor :players
    def initialize(players)

        array = []
        array << players

        @players = players

    end

    def add_players(number = 1)
        puts "would you like to add some players? (say yes or no)"
        input = gets.chomp
        if input == 'yes'
             @players += number
        else
            puts "ok never mind then"
end


end


end


rollcall = Team.new(5)
rollcall.add_players
print rollcall.players
