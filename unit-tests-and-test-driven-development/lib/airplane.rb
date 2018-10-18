
class Airplane
    attr_accessor :flying
def initialize(status)
    if
        status == 'flying'
        @flying = true
    else
        @flying = false
    end
end

def flying?
    @flying
end
end
