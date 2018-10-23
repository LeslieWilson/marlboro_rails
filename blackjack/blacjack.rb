
#Leslie Wilson
#Rails Homework Week 7


#This program defines a theater constructor so that it requires a number of seats. I'm trying to also maintain the number of patrons admitted with each instance. The number of patrons should start out as zero.

#Then I'm defineing an admit! instance method that optionally takes a single argument. This argument should represent the number of people to admit. It should default to 1 if the argument is not specified. Each time it is called, it should increase the number of patrons in the theater.

#If the number of patrons to admit exceeds capacity, I don't want to admit them. I want to  provide the usher with an error message and leave the number of admitted patrons unchanged. I want to write an instance method at_capacity? that checks to see if the Theater is at capacity. It should return true if the total number of patrons is equal to the number of seats. If the number of patrons hasn't reached capacity, the method should return false.


class Theater
    attr_accessor :seats, :patrons
    def initialize(number_seats)
        @seats = number_seats
        @patrons = 0

        def admit(number = 1)
                @patrons = @patrons += number
        end

    def at_capacity
        if @patrons > @seats
            puts "nope"
        else
            return false
        end

    end


end
end

theater = Theater.new(2)
theater.admit(4)
theater.at_capacity
