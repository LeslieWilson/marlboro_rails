# make weather object that initiates with a temp and a description of the day


class Weather
    attr_accessor :temp, :summary

    def initialize(temp, summary)
        @temp = temp
        @summary = summary
    end

    def warmer(degrees)
        @temp = @temp + degrees
    end

end





comment = Weather.new(30, "today is partly cloudy")

puts comment.summary
puts comment.temp
comment.warmer(10)
puts comment.temp
