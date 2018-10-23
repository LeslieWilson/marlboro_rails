
#Your Jukebox constructor should take in a playlist of songs as an argument. This playlist represents the songs that you are requesting the jukebox to play.

#Like any good jukebox, it is limited to a certain set of songs that it can actually play. Below is the list of songs the jukebox has to offer. Your constructor should eliminate any songs from your requested playlist that are not on this list:


# Implement a play! instance method that takes the first song on the list and removes it from the playlist permanently. Upon calling this method, the playing song should be returned in your terminal.

# Implement a shuffle_songs! method that randomizes the order of your playlist.

# Implement an add_track instance method that requires one argument, the name of the track. If the song is in list of available songs, your software should add the song the the end of the playlist and return true. If the song is not found on the list, it should just return false.

class Jukebox
    attr_accessor :playlist, :blah
    def initialize()
        @playlist = "Hello - Lionel Ritchie
Kokomo - The Beach Boys
Girl You Know It’s True - Milli Vanilli
Agadoo - Black Lace
Down Under - Men at Work
Nothing's Gonna Stop Us Now - Starship
Get Outta My Dreams, Get Into My Car - Billy Ocean
I Just Called To Say I Love You - Stevie Wonder
Hangin' Tough - New Kids on the Block
We Built This City - Starship
Wake Me Up Before You Go Go - Wham!
We Didn't Start The Fire - Billy Joel
I Wanna Dance With Somebody - Whitney Houston
U Can't Touch This - MC Hammer".lines.map(&:chomp)
    end

    def play!
        @playlist.pop
    end

    def shuffle_songs
        @playlist.sort_by {rand}
    end

def add_track(name)
    @name = name
    if @playlist.include?(name)
        @playlist << name
    else
        print "sorry, that song isin't an option"
        end
    end
end



    @playlist = Jukebox.new()
    print @playlist.add_track("Agadoo - Black La")
