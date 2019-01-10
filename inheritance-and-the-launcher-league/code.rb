class SuperHero
  attr_reader :public_identity, :secret_identity


  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

end

class Speedster < SuperHero
    def speed_in_mph
        60 * 1000
end

class Brawler < SuperHero
    def health
        20 * 100
end

class Detective < SuperHero
    include SuperHero
    def weakness
        puts "#{@secret_identity}"
end

class Demigod < SuperHero
end

class JackOfAllTrades < SuperHero
end

class WaterBased < SuperHero
end
