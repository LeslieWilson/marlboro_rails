# make an object that intializes with 3 variables - x y and z - thee variables will be integers when intialize the object with Thing.new


# make a method that adds all 3 variables together
# make a method that multiplies all 3 variables together
class Thing
    def initialize(x, y, z)
        @x = x
        @y = y
        @z = z
    end

    def addition
        "your added things equal #{@x + @y + @z}"
    end

    def multiplication
        "your multiplied things equal #{@x * @y * @z}"
    end

    def divide_or_multiply_by_2(input)
        if input == "multiply"
            @x *  2
        elsif input == "divide"
            @x / 2
        end
    end
end


thing = Thing.new(1,2,3)
puts thing.addition
puts thing.multiplication
puts thing.divide_by("multiply")
